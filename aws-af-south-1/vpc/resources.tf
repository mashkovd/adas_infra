resource "aws_vpc" "tfer--vpc-01b1f51ad054cb9ab" {
  assign_generated_ipv6_cidr_block = "false"
  cidr_block                       = "10.0.0.0/16"
  enable_classiclink               = "false"
  enable_classiclink_dns_support   = "false"
  enable_dns_hostnames             = "true"
  enable_dns_support               = "true"
  instance_tenancy                 = "default"
  ipv6_netmask_length              = "0"

  tags = {
    Name = "ugdas_prod-vpc"
    name = "UGDAS Prod VPC"
  }

  tags_all = {
    Name = "ugdas_prod-vpc"
    name = "UGDAS Prod VPC"
  }
}

resource "aws_vpc" "tfer--vpc-0537dd6b5e043706f" {
  assign_generated_ipv6_cidr_block = "false"
  cidr_block                       = "172.31.0.0/16"
  enable_classiclink               = "false"
  enable_classiclink_dns_support   = "false"
  enable_dns_hostnames             = "true"
  enable_dns_support               = "true"
  instance_tenancy                 = "default"
  ipv6_netmask_length              = "0"
}
