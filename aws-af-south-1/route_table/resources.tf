resource "aws_main_route_table_association" "tfer--vpc-01b1f51ad054cb9ab" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-0a828b20567707bf0_id}"
  vpc_id         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-01b1f51ad054cb9ab_id}"
}

resource "aws_main_route_table_association" "tfer--vpc-0537dd6b5e043706f" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-0e9eeaf897a25cf6e_id}"
  vpc_id         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0537dd6b5e043706f_id}"
}

resource "aws_route_table" "tfer--rtb-041dd4827002b797a" {
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "nat-0bf6a98cfd3c17fd2"
  }

  tags = {
    Name = "ugdas_prod-rtb-private2-af-south-1b"
    name = "UGDAS Prod VPC"
  }

  tags_all = {
    Name = "ugdas_prod-rtb-private2-af-south-1b"
    name = "UGDAS Prod VPC"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-01b1f51ad054cb9ab_id}"
}

resource "aws_route_table" "tfer--rtb-042b94e5ad13922df" {
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "nat-0f737138c1c0b819b"
  }

  tags = {
    Name = "ugdas_prod-rtb-private1-af-south-1a"
    name = "UGDAS Prod VPC"
  }

  tags_all = {
    Name = "ugdas_prod-rtb-private1-af-south-1a"
    name = "UGDAS Prod VPC"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-01b1f51ad054cb9ab_id}"
}

resource "aws_route_table" "tfer--rtb-0a828b20567707bf0" {
  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-01b1f51ad054cb9ab_id}"
}

resource "aws_route_table" "tfer--rtb-0e4a88ff77bcd11d3" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-07e8f71e45c1b514a"
  }

  tags = {
    Name = "ugdas_prod-rtb-public"
    name = "UGDAS Prod VPC"
  }

  tags_all = {
    Name = "ugdas_prod-rtb-public"
    name = "UGDAS Prod VPC"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-01b1f51ad054cb9ab_id}"
}

resource "aws_route_table" "tfer--rtb-0e9eeaf897a25cf6e" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0ecb26f3578af2a82"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0537dd6b5e043706f_id}"
}

resource "aws_route_table_association" "tfer--subnet-0129d756b8a499f89" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-0e4a88ff77bcd11d3_id}"
  subnet_id      = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0129d756b8a499f89_id}"
}

resource "aws_route_table_association" "tfer--subnet-04f0b8d9d4e5df681" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-041dd4827002b797a_id}"
  subnet_id      = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-04f0b8d9d4e5df681_id}"
}

resource "aws_route_table_association" "tfer--subnet-0a14bbedbd9af72ec" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-0e4a88ff77bcd11d3_id}"
  subnet_id      = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0a14bbedbd9af72ec_id}"
}

resource "aws_route_table_association" "tfer--subnet-0eba5f448360fb910" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-042b94e5ad13922df_id}"
  subnet_id      = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0eba5f448360fb910_id}"
}
