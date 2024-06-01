# main.tf
resource "aws_s3_bucket" "beanstalk_bucket" {
  bucket = var.s3_bucket_name
}

resource "aws_iam_role" "beanstalk_service_role" {
  name = "${var.app_name}-beanstalk-service-role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Effect" : "Allow",
      "Principal" : {
        "Service" : "elasticbeanstalk.amazonaws.com"
      },
      "Action" : "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "beanstalk_service_policy_attachment" {
  role       = aws_iam_role.beanstalk_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth"
}

resource "aws_iam_instance_profile" "beanstalk_instance_profile" {
  name = "${var.app_name}-beanstalk-instance-profile"

  role = aws_iam_role.beanstalk_instance_role.name
}

resource "aws_iam_role" "beanstalk_instance_role" {
  name = "${var.app_name}-beanstalk-instance-role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Effect" : "Allow",
      "Principal" : {
        "Service" : "ec2.amazonaws.com"
      },
      "Action" : "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "beanstalk_instance_policy_attachment" {
  role       = aws_iam_role.beanstalk_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}

resource "aws_iam_role_policy_attachment" "beanstalk_instance_policy_attachment_additional" {
  role       = aws_iam_role.beanstalk_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker"
}

resource "aws_elastic_beanstalk_application" "beanstalk_app" {
  name        = var.app_name
  description = "Elastic Beanstalk application for Django"
}

resource "aws_elastic_beanstalk_environment" "beanstalk_env" {
  name                = var.environment_name
  application         = aws_elastic_beanstalk_application.beanstalk_app.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.0.12 running Python 3.11"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.beanstalk_instance_profile.arn
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "SingleInstance"
  }
}

resource "aws_ecr_repository" "ecr_repo" {
  name = var.ecr_repository_name
}
