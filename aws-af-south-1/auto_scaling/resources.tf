resource "aws_autoscaling_group" "tfer--awseb-e-nupqmgez3v-stack-AWSEBAutoScalingGroup-pFP72ystFVx3" {
  availability_zones        = ["af-south-1a", "af-south-1b"]
  capacity_rebalance        = "false"
  default_cooldown          = "360"
  desired_capacity          = "1"
  force_delete              = "false"
  health_check_grace_period = "0"
  health_check_type         = "EC2"
  launch_configuration      = "${aws_launch_configuration.tfer--awseb-e-nupqmgez3v-stack-AWSEBAutoScalingLaunchConfiguration-mlMWuiJUcgKk.name}"
  max_instance_lifetime     = "0"
  max_size                  = "2"
  metrics_granularity       = "1Minute"
  min_size                  = "1"
  name                      = "awseb-e-nupqmgez3v-stack-AWSEBAutoScalingGroup-pFP72ystFVx3"
  protect_from_scale_in     = "false"
  service_linked_role_arn   = "arn:aws:iam::211125588594:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"

  tag {
    key                 = "Name"
    propagate_at_launch = "true"
    value               = "UGDAS-Prod-env"
  }

  tag {
    key                 = "elasticbeanstalk:environment-id"
    propagate_at_launch = "true"
    value               = "e-nupqmgez3v"
  }

  tag {
    key                 = "elasticbeanstalk:environment-name"
    propagate_at_launch = "true"
    value               = "UGDAS-Prod-env"
  }

  target_group_arns         = ["arn:aws:elasticloadbalancing:af-south-1:211125588594:targetgroup/awseb-AWSEB-RBAOHTTPJP48/2d6ad47a9d4b1e74"]
  vpc_zone_identifier       = ["${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-04f0b8d9d4e5df681_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0eba5f448360fb910_id}"]
  wait_for_capacity_timeout = "10m"
}

resource "aws_launch_configuration" "tfer--awseb-e-nupqmgez3v-stack-AWSEBAutoScalingLaunchConfiguration-mlMWuiJUcgKk" {
  associate_public_ip_address = "false"
  ebs_optimized               = "false"
  enable_monitoring           = "false"
  iam_instance_profile        = "aws-elasticbeanstalk-ec2-role"
  image_id                    = "ami-0d70d022254abe897"
  instance_type               = "t3.medium"
  name                        = "awseb-e-nupqmgez3v-stack-AWSEBAutoScalingLaunchConfiguration-mlMWuiJUcgKk"
  security_groups             = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--awseb-e-nupqmgez3v-stack-AWSEBSecurityGroup-dQqP27O2lwM3_sg-0607b5e6323e002bb_id}"]
  user_data_base64            = "Q29udGVudC1UeXBlOiBtdWx0aXBhcnQvbWl4ZWQ7IGJvdW5kYXJ5PSI9PT09PT09PT09PT09PT01MTg5MDY1Mzc3MjIyODk4NDA3PT0iCk1JTUUtVmVyc2lvbjogMS4wCgotLT09PT09PT09PT09PT09PTUxODkwNjUzNzcyMjI4OTg0MDc9PQpDb250ZW50LVR5cGU6IHRleHQvY2xvdWQtY29uZmlnOyBjaGFyc2V0PSJ1cy1hc2NpaSIKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogN2JpdApDb250ZW50LURpc3Bvc2l0aW9uOiBhdHRhY2htZW50OyBmaWxlbmFtZT0iY2xvdWQtY29uZmlnLnR4dCIKCiNjbG91ZC1jb25maWcKcmVwb191cGdyYWRlOiBub25lCnJlcG9fcmVsZWFzZXZlcjogMjAyMy40CmNsb3VkX2ZpbmFsX21vZHVsZXM6CiAtIFtzY3JpcHRzLXVzZXIsIGFsd2F5c10KCi0tPT09PT09PT09PT09PT09NTE4OTA2NTM3NzIyMjg5ODQwNz09CkNvbnRlbnQtVHlwZTogdGV4dC94LXNoZWxsc2NyaXB0OyBjaGFyc2V0PSJ1cy1hc2NpaSIKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogN2JpdApDb250ZW50LURpc3Bvc2l0aW9uOiBhdHRhY2htZW50OyBmaWxlbmFtZT0idXNlci1kYXRhLnR4dCIKCiMhL2Jpbi9iYXNoCmV4ZWMgPiA+KHRlZSAtYSAvdmFyL2xvZy9lYi1jZm4taW5pdC5sb2d8bG9nZ2VyIC10IFtlYi1jZm4taW5pdF0gLXMgMj4vZGV2L2NvbnNvbGUpIDI+JjEKZWNobyBbYGRhdGUgLXUgKyIlWS0lbS0lZFQlSDolTTolU1oiYF0gU3RhcnRlZCBFQiBVc2VyIERhdGEKc2V0IC14CgoKZnVuY3Rpb24gc2xlZXBfZGVsYXkgCnsKICBpZiAoKCAkU0xFRVBfVElNRSA8ICRTTEVFUF9USU1FX01BWCApKTsgdGhlbiAKICAgIGVjaG8gU2xlZXBpbmcgJFNMRUVQX1RJTUUKICAgIHNsZWVwICRTTEVFUF9USU1FICAKICAgIFNMRUVQX1RJTUU9JCgoJFNMRUVQX1RJTUUgKiAyKSkgCiAgZWxzZSAKICAgIGVjaG8gU2xlZXBpbmcgJFNMRUVQX1RJTUVfTUFYICAKICAgIHNsZWVwICRTTEVFUF9USU1FX01BWCAgCiAgZmkKfQoKIyBFeGVjdXRpbmcgYm9vdHN0cmFwIHNjcmlwdApTTEVFUF9USU1FPTIKU0xFRVBfVElNRV9NQVg9MzYwMAp3aGlsZSB0cnVlOyBkbyAKICBjdXJsIGh0dHBzOi8vZWxhc3RpY2JlYW5zdGFsay1wbGF0Zm9ybS1hc3NldHMtYWYtc291dGgtMS5zMy5hZi1zb3V0aC0xLmFtYXpvbmF3cy5jb20vc3RhbGtzL2ViX2Vjc19hbWF6b25fbGludXhfMjAyM18xLjAuNDAwLjBfMjAyNDA1MTMxOTMyMDMvbGliL1VzZXJEYXRhU2NyaXB0LnNoID4gL3RtcC9lYmJvb3RzdHJhcC5zaCAKICBSRVNVTFQ9JD8KICBpZiBbWyAiJFJFU1VMVCIgLW5lIDAgXV07IHRoZW4gCiAgICBzbGVlcF9kZWxheSAKICBlbHNlCiAgICAvYmluL2Jhc2ggL3RtcC9lYmJvb3RzdHJhcC5zaCAgICAgJ2h0dHBzOi8vY2xvdWRmb3JtYXRpb24td2FpdGNvbmRpdGlvbi1hZi1zb3V0aC0xLnMzLmFmLXNvdXRoLTEuYW1hem9uYXdzLmNvbS9hcm4lM0Fhd3MlM0FjbG91ZGZvcm1hdGlvbiUzQWFmLXNvdXRoLTElM0EyMTExMjU1ODg1OTQlM0FzdGFjay9hd3NlYi1lLW51cHFtZ2V6M3Ytc3RhY2svOTlkOGEyNzAtMWQwOC0xMWVmLTlkOGEtMDZmMzJiMTMxZmM0Lzk5ZGEyOTEwLTFkMDgtMTFlZi05ZDhhLTA2ZjMyYjEzMWZjNC9BV1NFQkluc3RhbmNlTGF1bmNoV2FpdEhhbmRsZT9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1EYXRlPTIwMjQwNTI4VDE1NDAyN1omWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JlgtQW16LUV4cGlyZXM9ODYzOTkmWC1BbXotQ3JlZGVudGlhbD1BS0lBNU40V0RBWTdURUtPWFpaNCUyRjIwMjQwNTI4JTJGYWYtc291dGgtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LVNpZ25hdHVyZT03MjFiMTdmNTdkYjQzZWQ4ODZlMDVmYmZjOWI2Y2JmZjVjMDUxNzI5ZmFkZGNkZjgxMmRlNzQ1OTcwYjYwOWFjJyAgICAnYXJuOmF3czpjbG91ZGZvcm1hdGlvbjphZi1zb3V0aC0xOjIxMTEyNTU4ODU5NDpzdGFjay9hd3NlYi1lLW51cHFtZ2V6M3Ytc3RhY2svOTlkOGEyNzAtMWQwOC0xMWVmLTlkOGEtMDZmMzJiMTMxZmM0JyAgICAnNzQxMzE0NDktNWMyZi00NTI1LWJmY2EtZWQzZTQ0ZjExY2Y0JyAgICAnaHR0cHM6Ly9lbGFzdGljYmVhbnN0YWxrLWhlYWx0aC5hZi1zb3V0aC0xLmFtYXpvbmF3cy5jb20nICAgICcnICAgICdodHRwczovL2VsYXN0aWNiZWFuc3RhbGstcGxhdGZvcm0tYXNzZXRzLWFmLXNvdXRoLTEuczMuYWYtc291dGgtMS5hbWF6b25hd3MuY29tL3N0YWxrcy9lYl9lY3NfYW1hem9uX2xpbnV4XzIwMjNfMS4wLjQwMC4wXzIwMjQwNTEzMTkzMjAzJyAgICAnYWYtc291dGgtMScKICAgIFJFU1VMVD0kPwogICAgaWYgW1sgIiRSRVNVTFQiIC1uZSAwIF1dOyB0aGVuIAogICAgICBzbGVlcF9kZWxheSAKICAgIGVsc2UgCiAgICAgIGV4aXQgMCAgCiAgICBmaSAKICBmaSAKZG9uZQoKLS09PT09PT09PT09PT09PT01MTg5MDY1Mzc3MjIyODk4NDA3PT0tLSA="
}
