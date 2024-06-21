resource "aws_elasticache_replication_group" "ugdas-backend-redis" {
  at_rest_encryption_enabled = "false"
  auto_minor_version_upgrade = "true"
  automatic_failover_enabled = "true"  # Enable automatic failover

  data_tiering_enabled          = "false"
  engine                        = "redis"
  maintenance_window            = "sat:02:30-sat:03:30"
  multi_az_enabled              = "false"
  node_type                     = "cache.t3.micro"
  number_cache_clusters         = 2
  parameter_group_name          = "default.redis7"
  port                          = "6379"
  replication_group_description = " "
  replication_group_id          = "ugdas-backend-redis"
  security_group_ids            = ["sg-0607b5e6323e002bb", "sg-07c18d74b54a1ee75", "sg-0dd89faa5fa15d7e6"]
  snapshot_retention_limit      = "1"
  snapshot_window               = "21:30-22:30"
  subnet_group_name             = "${aws_elasticache_subnet_group.ugdas-backend-redis.name}"
  transit_encryption_enabled    = "false"
}

resource "aws_elasticache_subnet_group" "default" {
  description = "Default CacheSubnetGroup"
  name        = "default"
  subnet_ids  = ["subnet-049ae2b70bf88fccb", "subnet-05c848716cae7c2d8", "subnet-06ce55fe6bf72db8e"]
}

resource "aws_elasticache_subnet_group" "ugdas-backend-redis" {
  description = " "
  name        = "ugdas-backend-redis"
  subnet_ids  = ["subnet-0129d756b8a499f89", "subnet-04f0b8d9d4e5df681", "subnet-0a14bbedbd9af72ec", "subnet-0eba5f448360fb910"]
}
