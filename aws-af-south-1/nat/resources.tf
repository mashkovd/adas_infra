resource "aws_nat_gateway" "tfer--nat-0bf6a98cfd3c17fd2" {
  allocation_id     = "eipalloc-049eab8001b38c7ca"
  connectivity_type = "public"
  subnet_id         = "subnet-0129d756b8a499f89"

  tags = {
    Name = "ugdas_prod-nat-public2-af-south-1b"
    name = "UGDAS Prod VPC"
  }

  tags_all = {
    Name = "ugdas_prod-nat-public2-af-south-1b"
    name = "UGDAS Prod VPC"
  }
}

resource "aws_nat_gateway" "tfer--nat-0f737138c1c0b819b" {
  allocation_id     = "eipalloc-0b6e48459e8b61d56"
  connectivity_type = "public"
  subnet_id         = "subnet-0a14bbedbd9af72ec"

  tags = {
    Name = "ugdas_prod-nat-public1-af-south-1a"
    name = "UGDAS Prod VPC"
  }

  tags_all = {
    Name = "ugdas_prod-nat-public1-af-south-1a"
    name = "UGDAS Prod VPC"
  }
}
