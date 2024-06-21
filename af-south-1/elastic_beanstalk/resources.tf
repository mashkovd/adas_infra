resource "aws_elastic_beanstalk_application" "ugdas-0020-Prod-0020-App" {
  name = "UGDAS Prod App"
}

# resource "aws_elastic_beanstalk_environment" "ugdas-Prod-env" {
#   application         = "UGDAS Prod App"
#   name                = "UGDAS-Prod-env"
# #   platform_arn        = "arn:aws:elasticbeanstalk:af-south-1::platform/ECS running on 64bit Amazon Linux 2023/4.0.8"
#   solution_stack_name = "64bit Amazon Linux 2023 v4.0.8 running ECS"
#   tier                = "WebServer"
#   version_label       = "0.0.25"
# }
