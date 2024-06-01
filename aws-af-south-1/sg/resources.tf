resource "aws_security_group" "tfer--awseb-e-nupqmgez3v-stack-AWSEBLoadBalancerSecurityGroup-BLiMpXy0Qetn_sg-07c18d74b54a1ee75" {
  description = "Load Balancer Security Group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "80"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "80"
  }

  name = "awseb-e-nupqmgez3v-stack-AWSEBLoadBalancerSecurityGroup-BLiMpXy0Qetn"

  tags = {
    Name                                = "UGDAS-Prod-env"
    "elasticbeanstalk:environment-id"   = "e-nupqmgez3v"
    "elasticbeanstalk:environment-name" = "UGDAS-Prod-env"
  }

  tags_all = {
    Name                                = "UGDAS-Prod-env"
    "elasticbeanstalk:environment-id"   = "e-nupqmgez3v"
    "elasticbeanstalk:environment-name" = "UGDAS-Prod-env"
  }

  vpc_id = "vpc-01b1f51ad054cb9ab"
}

resource "aws_security_group" "tfer--awseb-e-nupqmgez3v-stack-AWSEBSecurityGroup-dQqP27O2lwM3_sg-0607b5e6323e002bb" {
  description = "VPC Security Group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  ingress {
    from_port       = "80"
    protocol        = "tcp"
    security_groups = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--awseb-e-nupqmgez3v-stack-AWSEBLoadBalancerSecurityGroup-BLiMpXy0Qetn_sg-07c18d74b54a1ee75_id}"]
    self            = "false"
    to_port         = "80"
  }

  name = "awseb-e-nupqmgez3v-stack-AWSEBSecurityGroup-dQqP27O2lwM3"

  tags = {
    Name                                = "UGDAS-Prod-env"
    "elasticbeanstalk:environment-id"   = "e-nupqmgez3v"
    "elasticbeanstalk:environment-name" = "UGDAS-Prod-env"
  }

  tags_all = {
    Name                                = "UGDAS-Prod-env"
    "elasticbeanstalk:environment-id"   = "e-nupqmgez3v"
    "elasticbeanstalk:environment-name" = "UGDAS-Prod-env"
  }

  vpc_id = "vpc-01b1f51ad054cb9ab"
}

resource "aws_security_group" "tfer--default_sg-0620484cae3f89ce9" {
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name   = "default"
  vpc_id = "vpc-0537dd6b5e043706f"
}

resource "aws_security_group" "tfer--default_sg-0dd89faa5fa15d7e6" {
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  ingress {
    from_port       = "5432"
    protocol        = "tcp"
    security_groups = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--awseb-e-nupqmgez3v-stack-AWSEBSecurityGroup-dQqP27O2lwM3_sg-0607b5e6323e002bb_id}"]
    self            = "false"
    to_port         = "5432"
  }

  name   = "default"
  vpc_id = "vpc-01b1f51ad054cb9ab"
}
