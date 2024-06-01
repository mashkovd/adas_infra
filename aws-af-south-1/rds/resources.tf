resource "aws_db_instance" "tfer--ugdas-postgres-prod" {
  allocated_storage                     = "20"
  auto_minor_version_upgrade            = "true"
  availability_zone                     = "af-south-1b"
  backup_retention_period               = "1"
  backup_window                         = "08:11-08:41"
  ca_cert_identifier                    = "rds-ca-rsa2048-g1"
  copy_tags_to_snapshot                 = "true"
  customer_owned_ip_enabled             = "false"
  db_subnet_group_name                  = "${aws_db_subnet_group.tfer--default-vpc-01b1f51ad054cb9ab.name}"
  deletion_protection                   = "false"
  engine                                = "postgres"
  engine_version                        = "16.2"
  iam_database_authentication_enabled   = "false"
  identifier                            = "ugdas-postgres-prod"
  instance_class                        = "db.t3.micro"
  iops                                  = "0"
  kms_key_id                            = "arn:aws:kms:af-south-1:211125588594:key/26471ce7-546f-4d71-88bd-039ab9de2d48"
  license_model                         = "postgresql-license"
  maintenance_window                    = "sat:09:39-sat:10:09"
  max_allocated_storage                 = "1000"
  monitoring_interval                   = "0"
  multi_az                              = "false"
  option_group_name                     = "default:postgres-16"
  parameter_group_name                  = "default.postgres16"
  performance_insights_enabled          = "true"
  performance_insights_kms_key_id       = "arn:aws:kms:af-south-1:211125588594:key/26471ce7-546f-4d71-88bd-039ab9de2d48"
  performance_insights_retention_period = "7"
  port                                  = "5432"
  publicly_accessible                   = "false"
  storage_encrypted                     = "true"
  storage_type                          = "gp2"
  username                              = "ugdasdbuser"
  vpc_security_group_ids                = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--default_sg-0dd89faa5fa15d7e6_id}"]
}

resource "aws_db_snapshot" "tfer--rds-003A-ugdas-postgres-prod-2024-05-31-12-35" {
  db_instance_identifier = "ugdas-postgres-prod"
  db_snapshot_identifier = "rds:ugdas-postgres-prod-2024-05-31-12-35"
}

resource "aws_db_snapshot" "tfer--rds-003A-ugdas-postgres-prod-2024-06-01-08-15" {
  db_instance_identifier = "ugdas-postgres-prod"
  db_snapshot_identifier = "rds:ugdas-postgres-prod-2024-06-01-08-15"
}

resource "aws_db_snapshot" "tfer--ugdas-postgres-prod-snapshot" {
  db_instance_identifier = "ugdas-postgres-prod"
  db_snapshot_identifier = "ugdas-postgres-prod-snapshot"
}

resource "aws_db_subnet_group" "tfer--default-vpc-01b1f51ad054cb9ab" {
  description = "Created from the RDS Management Console"
  name        = "default-vpc-01b1f51ad054cb9ab"
  subnet_ids  = ["${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0129d756b8a499f89_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-04f0b8d9d4e5df681_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0a14bbedbd9af72ec_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0eba5f448360fb910_id}"]
}
