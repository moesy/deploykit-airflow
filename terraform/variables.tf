variable "aws_region" {
  default ="us-west-2"
  description = ""
}

variable "aws_access_key" {
  default ="AKIAIKAT2WHDGFPQNHLA"
  description = ""
}

variable "aws_secret_key" {
  default ="AEWiDPsx1iw9OAA3RgabrN1cycRmiQL1gaOtXjFB"
  description = ""
}

variable "zone_id" {
  default ="Z2AFBMXUMHUVGA"
  description =""
}

variable "private_key_path" {
  default ="~/sandbox/devbox/provision/setup/tasks/dotenv/ssh/grih_webserver.pem"
  description = ""
}

# redis-server & ../.rbenv/shims/bundle exec sidekiq -l log sidekiq.log & ../.rbenv/shims/bundle exec rails s &

variable "shell_username" {
  default ="ubuntu"
  description = ""
}

variable "shell_key" {
  default ="grih_webserver"
  description = ""
}

variable "playbook_path" {
  default ="setup/airflow.yml"
  description = ""
}


variable "db_identifier" {
  default = "airflow-postgres"
  description = "Identifier for your DB"
}

variable "storage" {
  default = "5"
  description = "Storage size in GB"
}

variable "engine" {
  default = "postgres"
  description = "Engine type, example values mysql, postgres"
}

variable "engine_version" {
  description = "Engine version"
  default = {
    mysql = "5.6.22"
    postgres = "9.4.1"
  }
}

variable "db_instance_class" {
  default = "db.t2.micro"
  description = "Instance class"
}

variable "db_name" {
  default = "airflow"
  description = "db name"
}

variable "db_username" {
  default = "hayek"
  description = "User name"
}

variable "db_password" {
  default ="zAzp5KtQrPydKEhs"
  description = "password, provide through your ENV variables"
}

variable "subnet_1_cidr" {
  default = "10.0.1.0/24"
  description = "Your AZ"
}

variable "subnet_2_cidr" {
  default = "10.0.2.0/24"
  description = "Your AZ"
}

variable "az_1" {
  default = "us-west-2a"
  description = "Your Az1, use AWS CLI to find your account specific"
}

variable "az_2" {
  default = "us-west-2b"
  description = "Your Az2, use AWS CLI to find your account specific"
}

variable "vpc_id" {
  default = "vpc-976fdaf2"
  description = "Your VPC ID"
}


# ------

variable "cache_name" {
  default="airflow-cache"
}

variable "cache_engine_version" {
  default = "2.8.22"
}

variable "cache_instance_type" {
  default = "cache.t2.micro"
}

variable "cache_maintenance_window" {
  # SUN 01:00AM-02:00AM ET
  default = "sun:05:00-sun:06:00"
}

variable "private_subnet_ids" {
  default="subnet-1ecd417b,subnet-1ecd417b,subnet-1ecd417b"
}


# ---

variable "password" {
  default ="zAzp5KtQrPydKEhs"
  description = "Database Password"
}

variable "cidr_blocks" {
  default = "0.0.0.0/0"
  description = "CIDR for sg"
}

variable "sg_name" {
  default = "rds_sg"
  description = "Tag Name for sg"
}
