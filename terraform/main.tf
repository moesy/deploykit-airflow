# Configure the AWS Provider
provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}

resource "aws_eip" "airflow" {
    instance = "${aws_instance.airflow-webserver.id}"
    depends_on = ["aws_instance.airflow-webserver"]

}


resource "aws_route53_record" "airflow" {
  depends_on = ["aws_instance.airflow-webserver"]
  zone_id = "Z2AFBMXUMHUVGA"
  name = "airflow"
  type = "A"
  ttl = "300"
  records = ["${aws_eip.airflow.public_ip}"]
}

resource "aws_instance" "airflow-webserver" {
    ami = "ami-9abea4fb"
    instance_type = "t2.medium"
    key_name = "${var.shell_key}"
    security_groups = ["Webserver"]


    tags {
        fleet = "airflow"
        type = "webserver"
        purpose = "internal"
        Name = "airflow-webserver"
        env = "prod"
        port = "8080"
    }


    # Make sure instance is live and responsive before running ansible playbook
    provisioner "remote-exec" {
      inline = ["ls"]
        connection {
          type = "ssh"
          user = "ubuntu"
          private_key = "${file(var.private_key_path)}"
       }
     }

    # Provision the server(s)
    provisioner "local-exec" {
      command = "ansible-playbook -i '${aws_instance.airflow-webserver.public_ip},' --private-key ${var.private_key_path}  -s ${var.playbook_path} -u ${var.shell_username} -T 300"
      # ansible-playbook -i 'airflow.openhawaii.org,' --private-key ~/sandbox/devbox/provision/setup/tasks/dotenv/ssh/grih_webserver.pem -s setup/airflow.yml -u ubuntu -T 300
    }
}

#
# Security group resources
#

resource "aws_security_group" "redis" {
  vpc_id = "${var.vpc_id}"

  # Redis Cache from anywhere (really only AWS instances on VPC can connect)

  ingress {
     from_port = 6379
     to_port = 6379
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }

  tags {
    Name = "sgCacheCluster"
  }
}

#
# ElastiCache resources
#
resource "aws_elasticache_cluster" "airflow-redis" {
  depends_on           = ["aws_elasticache_subnet_group.airflow-subnet-group"]
  cluster_id           = "${var.cache_name}"
  engine               = "redis"
  engine_version       = "${var.cache_engine_version}"
  maintenance_window   = "${var.cache_maintenance_window}"
  node_type            = "${var.cache_instance_type}"
  num_cache_nodes      = "1"
  parameter_group_name = "default.redis2.8"
  port                 = "6379"
  subnet_group_name    = "${aws_elasticache_subnet_group.airflow-subnet-group.name}"
  security_group_ids   = ["${aws_security_group.redis.id}"]

  tags {
    Name = "${var.cache_name}"
    fleet = "airflow"
    purpose = "internal"
    env = "prod"
    port = "6379"
  }
}

resource "aws_elasticache_subnet_group" "airflow-subnet-group" {
  name        = "${var.cache_name}-subnet-group"
  description = "Private subnets for the ElastiCache instances"
  subnet_ids  = ["${split(",", var.private_subnet_ids)}"]
}

# TODO: open redis cache ports
