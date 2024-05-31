terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }


  }
  backend "s3" {
    bucket = "adas-infra"
    key    = "terraform-state"
    region = "eu-north-1"
  }
}


provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_ssh_key" "default" {
  name       = "default"
  public_key = file(var.ssh_public_key)
}

resource "hcloud_server" "gitlab_runner" {
  name        = "gitlab-runner"
  server_type = "cx21"
  image       = "ubuntu-20.04"
  datacenter  = "fsn1-dc14"

  ssh_keys = [hcloud_ssh_key.default.id]

  user_data = templatefile("${path.module}/cloud-init.yml", {
    gitlab_url                       = var.gitlab_url
    gitlab_runner_registration_token = var.gitlab_runner_registration_token
    gitlab_pat                       = var.gitlab_pat
    private_key                      = file(var.ssh_private_key)
    public_key                       = file(var.ssh_public_key)
  })

  labels = {
    role = "gitlab-runner"
  }
}

output "server_ip" {
  value = hcloud_server.gitlab_runner.ipv4_address
}



provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_s3_bucket" "infra_bucket" {
  bucket = "adas-infra"

  tags = {
    Name        = "adas-infra-bucket"
    Environment = "dev"
  }
}

resource "aws_iam_user" "gitlab_ci_user" {
  name = "gitlab-ci-user"

  tags = {
    Name        = "gitlab-ci-user"
    Environment = "prod"
  }
}

resource "aws_iam_user_policy" "gitlab_ci_user_policy" {
  name   = "gitlab-ci-user-policy"
  user   = aws_iam_user.gitlab_ci_user.name
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "elasticbeanstalk:CreateApplication",
        "elasticbeanstalk:CreateEnvironment",
        "elasticbeanstalk:UpdateEnvironment",
        "elasticbeanstalk:TerminateEnvironment",
        "elasticbeanstalk:DescribeEnvironments",
        "elasticbeanstalk:DescribeApplicationVersions",
        "s3:PutObject",
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role" "gitlab_ci_role" {
  name = "gitlab-ci-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "${aws_iam_user.gitlab_ci_user.arn}"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "gitlab_ci_policy" {
  name        = "gitlab-ci-policy"
  description = "Policy for GitLab CI/CD pipeline"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "elasticbeanstalk:CreateApplication",
        "elasticbeanstalk:CreateEnvironment",
        "elasticbeanstalk:UpdateEnvironment",
        "elasticbeanstalk:TerminateEnvironment",
        "elasticbeanstalk:DescribeEnvironments",
        "elasticbeanstalk:DescribeApplicationVersions",
        "s3:PutObject",
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "ecr_policy" {
  name        = "ecr-policy"
  description = "Policy for ECR operations"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:BatchGetImage",
        "ecr:GetDownloadUrlForLayer",
        "ecr:InitiateLayerUpload",
        "ecr:UploadLayerPart",
        "ecr:CompleteLayerUpload",
        "ecr:PutImage"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "gitlab_ci_role_policy_attachment" {
  role       = aws_iam_role.gitlab_ci_role.name
  policy_arn = aws_iam_policy.gitlab_ci_policy.arn
}

resource "aws_iam_user_policy_attachment" "gitlab_ci_user_ecr_policy_attachment" {
  user       = aws_iam_user.gitlab_ci_user.name
  policy_arn = aws_iam_policy.ecr_policy.arn
}
# module "elasticbeanstalk" {
#   source = "./elasticbeanstalk"
# }
