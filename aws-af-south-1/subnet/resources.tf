resource "aws_subnet" "tfer--subnet-0129d756b8a499f89" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.16.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "ugdas_prod-subnet-public2-af-south-1b"
    name = "UGDAS Prod VPC"
  }

  tags_all = {
    Name = "ugdas_prod-subnet-public2-af-south-1b"
    name = "UGDAS Prod VPC"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-01b1f51ad054cb9ab_id}"
}

resource "aws_subnet" "tfer--subnet-049ae2b70bf88fccb" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.16.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0537dd6b5e043706f_id}"
}

resource "aws_subnet" "tfer--subnet-04f0b8d9d4e5df681" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.144.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "ugdas_prod-subnet-private2-af-south-1b"
    name = "UGDAS Prod VPC"
  }

  tags_all = {
    Name = "ugdas_prod-subnet-private2-af-south-1b"
    name = "UGDAS Prod VPC"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-01b1f51ad054cb9ab_id}"
}

resource "aws_subnet" "tfer--subnet-05c848716cae7c2d8" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.32.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0537dd6b5e043706f_id}"
}

resource "aws_subnet" "tfer--subnet-06ce55fe6bf72db8e" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.0.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0537dd6b5e043706f_id}"
}

resource "aws_subnet" "tfer--subnet-0a14bbedbd9af72ec" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.0.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "ugdas_prod-subnet-public1-af-south-1a"
    name = "UGDAS Prod VPC"
  }

  tags_all = {
    Name = "ugdas_prod-subnet-public1-af-south-1a"
    name = "UGDAS Prod VPC"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-01b1f51ad054cb9ab_id}"
}

resource "aws_subnet" "tfer--subnet-0eba5f448360fb910" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.128.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "ugdas_prod-subnet-private1-af-south-1a"
    name = "UGDAS Prod VPC"
  }

  tags_all = {
    Name = "ugdas_prod-subnet-private1-af-south-1a"
    name = "UGDAS Prod VPC"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-01b1f51ad054cb9ab_id}"
}
