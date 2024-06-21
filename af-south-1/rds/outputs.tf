output "aws_db_instance_ugdas-postgres-prod_id" {
  value = "${aws_db_instance.ugdas-postgres-prod.id}"
}

# output "aws_db_snapshot_rds-003A-ugdas-postgres-prod-2024-06-05-08-15_id" {
#   value = "${aws_db_snapshot.rds-003A-ugdas-postgres-prod-2024-06-05-08-15.id}"
# }
#
# output "aws_db_snapshot_rds-003A-ugdas-postgres-prod-2024-06-06-08-15_id" {
#   value = "${aws_db_snapshot.rds-003A-ugdas-postgres-prod-2024-06-06-08-15.id}"
# }
#
# output "aws_db_snapshot_rds-003A-ugdas-postgres-prod-2024-06-07-08-15_id" {
#   value = "${aws_db_snapshot.rds-003A-ugdas-postgres-prod-2024-06-07-08-15.id}"
# }
#
# output "aws_db_snapshot_ugdas-postgres-prod-snapshot_id" {
#   value = "${aws_db_snapshot.ugdas-postgres-prod-snapshot.id}"
# }

output "aws_db_subnet_group_default-vpc-01b1f51ad054cb9ab_id" {
  value = "${aws_db_subnet_group.default-vpc-01b1f51ad054cb9ab.id}"
}
