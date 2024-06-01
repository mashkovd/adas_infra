resource "aws_docdb_subnet_group" "tfer--default-vpc-01b1f51ad054cb9ab" {
  description = "Created from the RDS Management Console"
  name        = "default-vpc-01b1f51ad054cb9ab"
  subnet_ids  = ["subnet-0129d756b8a499f89", "subnet-04f0b8d9d4e5df681", "subnet-0a14bbedbd9af72ec", "subnet-0eba5f448360fb910"]
}
