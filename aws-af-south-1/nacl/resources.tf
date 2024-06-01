resource "aws_default_network_acl" "tfer--acl-0af408e2fa16ae85c" {
  egress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "100"
    to_port    = "0"
  }

  ingress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "100"
    to_port    = "0"
  }

  subnet_ids = ["${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-049ae2b70bf88fccb_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-05c848716cae7c2d8_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-06ce55fe6bf72db8e_id}"]
}

resource "aws_default_network_acl" "tfer--acl-0ef34d8de2028ae9d" {
  egress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "100"
    to_port    = "0"
  }

  ingress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "100"
    to_port    = "0"
  }

  subnet_ids = ["${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0129d756b8a499f89_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-04f0b8d9d4e5df681_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0a14bbedbd9af72ec_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0eba5f448360fb910_id}"]
}
