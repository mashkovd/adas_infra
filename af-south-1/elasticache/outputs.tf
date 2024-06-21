
output "aws_elasticache_subnet_group_default_id" {
  value = "${aws_elasticache_subnet_group.default.id}"
}

output "aws_elasticache_subnet_group_ugdas-backend-redis_id" {
  value = "${aws_elasticache_subnet_group.ugdas-backend-redis.id}"
}
