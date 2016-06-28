output "cache_security_group_id" {
  value = "${aws_security_group.redis.id}"
}

output "airflow_webserver_hostname" {
  value = "${aws_instance.airflow-webserver.public_ip}"
}

output "redis_cache_hostname" {
  value = "${aws_elasticache_cluster.airflow-redis.cache_nodes.0.address}"
}

output "port" {
  value = "${aws_elasticache_cluster.airflow-redis.cache_nodes.0.port}"
}

output "endpoint" {
  value = "${join(":", aws_elasticache_cluster.airflow-redis.cache_nodes.0.address, aws_elasticache_cluster.airflow-redis.cache_nodes.0.port)}"
}

output "domain" {
  value = "${aws_route53_record.airflow.fqdn}"
}
