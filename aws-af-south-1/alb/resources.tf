resource "aws_lb" "tfer--awseb--AWSEB-yHaL3qfolzWi" {
  desync_mitigation_mode           = "defensive"
  drop_invalid_header_fields       = "false"
  enable_cross_zone_load_balancing = "true"
  enable_deletion_protection       = "false"
  enable_http2                     = "true"
  enable_waf_fail_open             = "false"
  idle_timeout                     = "60"
  internal                         = "false"
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "awseb--AWSEB-yHaL3qfolzWi"
  security_groups                  = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--awseb-e-nupqmgez3v-stack-AWSEBLoadBalancerSecurityGroup-BLiMpXy0Qetn_sg-07c18d74b54a1ee75_id}"]

  subnet_mapping {
    subnet_id = "subnet-0129d756b8a499f89"
  }

  subnet_mapping {
    subnet_id = "subnet-0a14bbedbd9af72ec"
  }

  subnets = ["${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0129d756b8a499f89_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0a14bbedbd9af72ec_id}"]

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
}

resource "aws_lb_listener" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-af-south-1-003A-211125588594-003A-listener-002F-app-002F-awseb--AWSEB-yHaL3qfolzWi-002F-e511ac1e2da8e173-002F-61b318731c134417" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:af-south-1:211125588594:targetgroup/awseb-AWSEB-RBAOHTTPJP48/2d6ad47a9d4b1e74"
    type             = "forward"
  }

  load_balancer_arn = "${data.terraform_remote_state.alb.outputs.aws_lb_tfer--awseb--AWSEB-yHaL3qfolzWi_id}"
  port              = "80"
  protocol          = "HTTP"
}

resource "aws_lb_target_group" "tfer--awseb-AWSEB-RBAOHTTPJP48" {
  deregistration_delay = "20"

  health_check {
    enabled             = "true"
    healthy_threshold   = "3"
    interval            = "15"
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = "5"
    unhealthy_threshold = "5"
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "awseb-AWSEB-RBAOHTTPJP48"
  port                          = "80"
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  slow_start                    = "0"

  stickiness {
    cookie_duration = "86400"
    enabled         = "false"
    type            = "lb_cookie"
  }

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

  target_type = "instance"
  vpc_id      = "vpc-01b1f51ad054cb9ab"
}

resource "aws_lb_target_group_attachment" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-af-south-1-003A-211125588594-003A-targetgroup-002F-awseb-AWSEB-RBAOHTTPJP48-002F-2d6ad47a9d4b1e74-i-048a9cfb4c87a89d4" {
  target_group_arn = "arn:aws:elasticloadbalancing:af-south-1:211125588594:targetgroup/awseb-AWSEB-RBAOHTTPJP48/2d6ad47a9d4b1e74"
  target_id        = "i-048a9cfb4c87a89d4"
}
