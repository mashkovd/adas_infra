resource "aws_iam_group" "devops" {
  name = "devops"
  path = "/"
}

resource "aws_iam_group" "ugdas-s3-group" {
  name = "ugdas-s3-group"
  path = "/"
}
#
# resource "aws_iam_group_policy" "ugdas-s3-group_ugdas-s3-bucket-manager-policy" {
#   group = "ugdas-s3-group"
#   name  = "ugdas-s3-bucket-manager-policy"
#
#   policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "s3:*",
#       "Effect": "Allow",
#       "Resource": [
#         "arn:aws:s3:::ugdas",
#         "arn:aws:s3:::ugdas/*",
#         "arn:aws:s3:::ugdas-initial-backup",
#         "arn:aws:s3:::ugdas-initial-backup/*"
#       ]
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
# }
#
# resource "aws_iam_group_policy_attachment" "devops_AdministratorAccess" {
#   group      = "devops"
#   policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
# }
#
# resource "aws_iam_group_policy_attachment" "devops_AmazonAPIGatewayAdministrator" {
#   group      = "devops"
#   policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator"
# }
#
resource "aws_iam_instance_profile" "aws-elasticbeanstalk-ec2-role" {
  name = "aws-elasticbeanstalk-ec2-role"
  path = "/"
  role = "aws-elasticbeanstalk-ec2-role"
}

resource "aws_iam_instance_profile" "beanstalk-profile" {
  name = "beanstalk-profile"
  path = "/"
  role = "beanstalk-role"
}
#
resource "aws_iam_instance_profile" "ecsInstanceRole" {
  name = "ecsInstanceRole"
  path = "/"
  role = "ecsInstanceRole"
}
#
# resource "aws_iam_instance_profile" "ugdas-beanstalk-instance-profile" {
#   name = "ugdas-beanstalk-instance-profile"
#   path = "/"
#   role = "ugdas-beanstalk-instance-role"
# }
#
resource "aws_iam_instance_profile" "ugdas-environment-eb-ec2" {
  name = "ugdas-environment-eb-ec2"
  path = "/"
  role = "ugdas-environment-eb-ec2"

  tags = {
    Name = "ugdas-environment"
  }

  tags_all = {
    Name = "ugdas-environment"
  }
}
#
resource "aws_iam_instance_profile" "ugdas-instance-profile" {
  name = "ugdas-instance-profile"
  path = "/"
  role = "ugdas-role"
}
#
# resource "aws_iam_policy" "api-ecr" {
#   arn  = "arn:aws:iam::123456789012:policy/api-ecr"
#   name = "api-ecr"
#   path = "/"
#
#   policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": [
#         "ecr:*"
#       ],
#       "Effect": "Allow",
#       "Resource": "*",
#       "Sid": "VisualEditor0"
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
# }
#
resource "aws_iam_policy" "ecr-policy" {
  description = "Policy for ECR operations"
  name        = "ecr-policy"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
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
      "Effect": "Allow",
      "Resource": "*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "gitlab-ci-policy" {
  description = "Policy for GitLab CI/CD pipeline"
  name        = "gitlab-ci-policy"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
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
      "Effect": "Allow",
      "Resource": "*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

# resource "aws_iam_policy" "s3_react_policy" {
#   name = "s3_react_policy"
#   path = "/"
#
#   policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "s3:ListBucket",
#       "Effect": "Allow",
#       "Resource": "arn:aws:s3:::eposta-api-integration-react",
#       "Sid": "VisualEditor0"
#     },
#     {
#       "Action": [
#         "s3:PutObject",
#         "s3:GetObject",
#         "s3:DeleteObject"
#       ],
#       "Effect": "Allow",
#       "Resource": "arn:aws:s3:::eposta-api-integration-react/*",
#       "Sid": "VisualEditor1"
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
# }
#
# resource "aws_iam_policy" "s3_vue_policy" {
#   name = "s3_vue_policy"
#   path = "/"
#
#   policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "s3:ListBucket",
#       "Effect": "Allow",
#       "Resource": "arn:aws:s3:::zaidi-administration",
#       "Sid": "VisualEditor0"
#     },
#     {
#       "Action": [
#         "s3:PutObject",
#         "s3:GetObject",
#         "s3:DeleteObject"
#       ],
#       "Effect": "Allow",
#       "Resource": "arn:aws:s3:::zaidi-administration/*",
#       "Sid": "VisualEditor1"
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
# }
#
# resource "aws_iam_role" "AWSServiceRoleForAutoScaling" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "autoscaling.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   description          = "Default Service-Linked Role enables access to AWS Services and Resources used or managed by Auto Scaling"
#   managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AutoScalingServiceRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForAutoScaling"
#   path                 = "/aws-service-role/autoscaling.amazonaws.com/"
# }
#
# resource "aws_iam_role" "AWSServiceRoleForECS" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ecs.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   description          = "Role to enable Amazon ECS to manage your cluster."
#   managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AmazonECSServiceRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForECS"
#   path                 = "/aws-service-role/ecs.amazonaws.com/"
# }
#
# resource "aws_iam_role" "AWSServiceRoleForEc2InstanceConnect" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ec2-instance-connect.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   description          = "The Service Linked Role used by EC2 Instance Connect Endpoint."
#   managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/Ec2InstanceConnectEndpoint"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForEc2InstanceConnect"
#   path                 = "/aws-service-role/ec2-instance-connect.amazonaws.com/"
# }
#
# resource "aws_iam_role" "AWSServiceRoleForElastiCache" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "elasticache.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   description          = "This policy allows ElastiCache to manage AWS resources on your behalf as necessary for managing your cache."
#   managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/ElastiCacheServiceRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForElastiCache"
#   path                 = "/aws-service-role/elasticache.amazonaws.com/"
# }
#
# resource "aws_iam_role" "AWSServiceRoleForElasticBeanstalk" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "elasticbeanstalk.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSElasticBeanstalkServiceRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForElasticBeanstalk"
#   path                 = "/aws-service-role/elasticbeanstalk.amazonaws.com/"
# }
#
# resource "aws_iam_role" "AWSServiceRoleForElasticLoadBalancing" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "elasticloadbalancing.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   description          = "Allows ELB to call AWS services on your behalf."
#   managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSElasticLoadBalancingServiceRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForElasticLoadBalancing"
#   path                 = "/aws-service-role/elasticloadbalancing.amazonaws.com/"
# }
#
# resource "aws_iam_role" "AWSServiceRoleForGlobalAccelerator" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "globalaccelerator.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   description          = "Allows Global Accelerator to call AWS services on customer's behalf"
#   managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSGlobalAcceleratorSLRPolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForGlobalAccelerator"
#   path                 = "/aws-service-role/globalaccelerator.amazonaws.com/"
# }
#
# resource "aws_iam_role" "AWSServiceRoleForRDS" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "rds.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   description          = "Allows Amazon RDS to manage AWS resources on your behalf"
#   managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AmazonRDSServiceRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForRDS"
#   path                 = "/aws-service-role/rds.amazonaws.com/"
# }
#
# resource "aws_iam_role" "AWSServiceRoleForSupport" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "support.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   description          = "Enables resource access for AWS to provide billing, administrative and support services"
#   managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSSupportServiceRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForSupport"
#   path                 = "/aws-service-role/support.amazonaws.com/"
# }
#
# resource "aws_iam_role" "AWSServiceRoleForTrustedAdvisor" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "trustedadvisor.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   description          = "Access for the AWS Trusted Advisor Service to help reduce cost, increase performance, and improve security of your AWS environment."
#   managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSTrustedAdvisorServiceRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForTrustedAdvisor"
#   path                 = "/aws-service-role/trustedadvisor.amazonaws.com/"
# }
#
# resource "aws_iam_role" "api_registry_role" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRoleWithWebIdentity",
#       "Condition": {
#         "StringEquals": {
#           "africaone.dev:aud": "api_client"
#         }
#       },
#       "Effect": "Allow",
#       "Principal": {
#         "Federated": "arn:aws:iam::211125588594:oidc-provider/africaone.dev"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   inline_policy {
#     name   = "ElasticBeanstalkECSTaskForCICD"
#     policy = "{\n\t\"Version\": \"2012-10-17\",\n\t\"Statement\": [\n\t\t{\n\t\t\t\"Sid\": \"VisualEditor0\",\n\t\t\t\"Effect\": \"Allow\",\n\t\t\t\"Action\": \"ecs:RegisterTaskDefinition\",\n\t\t\t\"Resource\": \"*\"\n\t\t}\n\t]\n}"
#   }
#
#   inline_policy {
#     name   = "ElasticBeanstalkPolicyForCICD"
#     policy = "{\n\t\"Version\": \"2012-10-17\",\n\t\"Statement\": [\n\t\t{\n\t\t\t\"Sid\": \"VisualEditor0\",\n\t\t\t\"Effect\": \"Allow\",\n\t\t\t\"Action\": [\n\t\t\t \"elasticbeanstalk:*\",\n                \"s3:*\",\n                \"ec2:*\",\n                \"cloudwatch:*\",\n                \"autoscaling:*\",\n                \"elasticloadbalancing:*\",\n                \"rds:*\",\n                \"cloudformation:*\",\n                \"iam:PassRole\"\n\t\t\t],\n\t\t\t\"Resource\": \"*\"\n\t\t}\n\t]\n}"
#   }
#
#   inline_policy {
#     name   = "S3PutObjectForCICD"
#     policy = "{\n\t\"Version\": \"2012-10-17\",\n\t\"Statement\": [\n\t\t{\n\t\t\t\"Sid\": \"VisualEditor0\",\n\t\t\t\"Effect\": \"Allow\",\n\t\t\t\"Action\": \"s3:*\",\n\t\t\t\"Resource\": \"arn:aws:s3:::elasticbeanstalk-af-south-1-211125588594/*\"\n\t\t}\n\t]\n}"
#   }
#
#   managed_policy_arns  = ["arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"]
#   max_session_duration = "3600"
#   name                 = "api_registry_role"
#   path                 = "/"
# }
#
# resource "aws_iam_role" "aws-elasticbeanstalk-ec2-role" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   description          = "Allows EC2 instances to call AWS services on your behalf."
#   managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker", "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier", "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier", "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"]
#   max_session_duration = "3600"
#   name                 = "aws-elasticbeanstalk-ec2-role"
#   path                 = "/"
# }
#
# resource "aws_iam_role" "aws-elasticbeanstalk-service-role" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Condition": {
#         "StringEquals": {
#           "sts:ExternalId": "elasticbeanstalk"
#         }
#       },
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "elasticbeanstalk.amazonaws.com"
#       },
#       "Sid": ""
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   description          = "Allows Elastic Beanstalk to create and manage AWS resources on your behalf."
#   managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSElasticBeanstalkManagedUpdatesCustomerRolePolicy", "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth", "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkService"]
#   max_session_duration = "3600"
#   name                 = "aws-elasticbeanstalk-service-role"
#   path                 = "/"
# }
#
# resource "aws_iam_role" "beanstalk-role" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   max_session_duration = "3600"
#   name                 = "beanstalk-role"
#   path                 = "/"
# }
#
# resource "aws_iam_role" "ecsInstanceRole" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Sid": ""
#     }
#   ],
#   "Version": "2008-10-17"
# }
# POLICY
#
#   managed_policy_arns  = ["arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"]
#   max_session_duration = "3600"
#   name                 = "ecsInstanceRole"
#   path                 = "/"
# }
#
# resource "aws_iam_role" "gitlab-ci-role" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "AWS": "arn:aws:iam::211125588594:user/gitlab-ci-user"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   managed_policy_arns  = ["arn:aws:iam::211125588594:policy/gitlab-ci-policy"]
#   max_session_duration = "3600"
#   name                 = "gitlab-ci-role"
#   path                 = "/"
# }
#
# resource "aws_iam_role" "rds-monitoring-role" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "monitoring.rds.amazonaws.com"
#       },
#       "Sid": ""
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   managed_policy_arns  = ["arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"]
#   max_session_duration = "3600"
#   name                 = "rds-monitoring-role"
#   path                 = "/"
# }
#
# resource "aws_iam_role" "s3_cicd_deploy_role" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRoleWithWebIdentity",
#       "Condition": {
#         "StringEquals": {
#           "africaone.dev:aud": [
#             "vue_client",
#             "react_client"
#           ]
#         }
#       },
#       "Effect": "Allow",
#       "Principal": {
#         "Federated": "arn:aws:iam::211125588594:oidc-provider/africaone.dev"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   inline_policy {
#     name   = "s3-buckets-deploy-policy"
#     policy = "{\n    \"Version\": \"2012-10-17\",\n    \"Statement\": [\n        {\n            \"Sid\": \"VisualEditor0\",\n            \"Effect\": \"Allow\",\n            \"Action\": \"s3:ListBucket\",\n            \"Resource\": \"arn:aws:s3:::eposta-api-integration-react\"\n        },\n        {\n            \"Sid\": \"VisualEditor1\",\n            \"Effect\": \"Allow\",\n            \"Action\": [\n                \"s3:PutObject\",\n                \"s3:GetObject\",\n                \"s3:DeleteObject\"\n            ],\n            \"Resource\": [\n                \"arn:aws:s3:::admin.das.ug/*\",\n                \"arn:aws:s3:::das.ug/*\",\n                \"arn:aws:s3:::eposta-integration.das.ug/*\",\n                \"arn:aws:s3:::zaidi.ug/*\"\n                ]\n        }\n    ]\n}"
#   }
#
#   max_session_duration = "3600"
#   name                 = "s3_cicd_deploy_role"
#   path                 = "/"
# }
#
# resource "aws_iam_role" "ugdas-beanstalk-instance-role" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   inline_policy {
#     name   = "ugdas-additional-ec2-permissions"
#     policy = "{\"Statement\":[{\"Action\":\"ecr:*\",\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
#   }
#
#   managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker", "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"]
#   max_session_duration = "3600"
#   name                 = "ugdas-beanstalk-instance-role"
#   path                 = "/"
# }
#
# resource "aws_iam_role" "ugdas-beanstalk-service-role" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "elasticbeanstalk.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   managed_policy_arns  = ["arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth"]
#   max_session_duration = "3600"
#   name                 = "ugdas-beanstalk-service-role"
#   path                 = "/"
# }
#
# resource "aws_iam_role" "ugdas-environment-eb-ec2" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       }
#     },
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ssm.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   max_session_duration = "3600"
#   name                 = "ugdas-environment-eb-ec2"
#   path                 = "/"
#
#   tags = {
#     Name = "ugdas-environment"
#   }
#
#   tags_all = {
#     Name = "ugdas-environment"
#   }
# }
#
# resource "aws_iam_role" "ugdas-environment-eb-service" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "elasticbeanstalk.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   max_session_duration = "3600"
#   name                 = "ugdas-environment-eb-service"
#   path                 = "/"
#
#   tags = {
#     Name = "ugdas-environment"
#   }
#
#   tags_all = {
#     Name = "ugdas-environment"
#   }
# }
#
# resource "aws_iam_role" "ugdas-role" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   inline_policy {
#     name   = "ugdas-policy"
#     policy = "{\"Statement\":[{\"Action\":[\"ec2:Describe*\",\"elasticloadbalancing:Describe*\",\"cloudwatch:PutMetricData\",\"cloudwatch:ListMetrics\",\"cloudwatch:GetMetricStatistics\",\"autoscaling:Describe*\",\"s3:*\",\"logs:*\",\"ecr:*\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
#   }
#
#   max_session_duration = "3600"
#   name                 = "ugdas-role"
#   path                 = "/"
# }
#
# resource "aws_iam_role_policy" "api_registry_role_ElasticBeanstalkECSTaskForCICD" {
#   name = "ElasticBeanstalkECSTaskForCICD"
#
#   policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "ecs:RegisterTaskDefinition",
#       "Effect": "Allow",
#       "Resource": "*",
#       "Sid": "VisualEditor0"
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   role = "api_registry_role"
# }
#
# resource "aws_iam_role_policy" "api_registry_role_ElasticBeanstalkPolicyForCICD" {
#   name = "ElasticBeanstalkPolicyForCICD"
#
#   policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": [
#         "elasticbeanstalk:*",
#         "s3:*",
#         "ec2:*",
#         "cloudwatch:*",
#         "autoscaling:*",
#         "elasticloadbalancing:*",
#         "rds:*",
#         "cloudformation:*",
#         "iam:PassRole"
#       ],
#       "Effect": "Allow",
#       "Resource": "*",
#       "Sid": "VisualEditor0"
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   role = "api_registry_role"
# }
#
# resource "aws_iam_role_policy" "api_registry_role_S3PutObjectForCICD" {
#   name = "S3PutObjectForCICD"
#
#   policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "s3:*",
#       "Effect": "Allow",
#       "Resource": "arn:aws:s3:::elasticbeanstalk-af-south-1-211125588594/*",
#       "Sid": "VisualEditor0"
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   role = "api_registry_role"
# }
#
# resource "aws_iam_role_policy" "s3_cicd_deploy_role_s3-buckets-deploy-policy" {
#   name = "s3-buckets-deploy-policy"
#
#   policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "s3:ListBucket",
#       "Effect": "Allow",
#       "Resource": "arn:aws:s3:::eposta-api-integration-react",
#       "Sid": "VisualEditor0"
#     },
#     {
#       "Action": [
#         "s3:PutObject",
#         "s3:GetObject",
#         "s3:DeleteObject"
#       ],
#       "Effect": "Allow",
#       "Resource": [
#         "arn:aws:s3:::admin.das.ug/*",
#         "arn:aws:s3:::das.ug/*",
#         "arn:aws:s3:::eposta-integration.das.ug/*",
#         "arn:aws:s3:::zaidi.ug/*"
#       ],
#       "Sid": "VisualEditor1"
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   role = "s3_cicd_deploy_role"
# }
#
# resource "aws_iam_role_policy" "ugdas-beanstalk-instance-role_ugdas-additional-ec2-permissions" {
#   name = "ugdas-additional-ec2-permissions"
#
#   policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "ecr:*",
#       "Effect": "Allow",
#       "Resource": "*"
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   role = "ugdas-beanstalk-instance-role"
# }
#
# resource "aws_iam_role_policy" "ugdas-role_ugdas-policy" {
#   name = "ugdas-policy"
#
#   policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": [
#         "ec2:Describe*",
#         "elasticloadbalancing:Describe*",
#         "cloudwatch:PutMetricData",
#         "cloudwatch:ListMetrics",
#         "cloudwatch:GetMetricStatistics",
#         "autoscaling:Describe*",
#         "s3:*",
#         "logs:*",
#         "ecr:*"
#       ],
#       "Effect": "Allow",
#       "Resource": "*"
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   role = "ugdas-role"
# }
#
# resource "aws_iam_role_policy_attachment" "AWSServiceRoleForAutoScaling_AutoScalingServiceRolePolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AutoScalingServiceRolePolicy"
#   role       = "AWSServiceRoleForAutoScaling"
# }
#
# resource "aws_iam_role_policy_attachment" "AWSServiceRoleForECS_AmazonECSServiceRolePolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonECSServiceRolePolicy"
#   role       = "AWSServiceRoleForECS"
# }
#
# resource "aws_iam_role_policy_attachment" "AWSServiceRoleForEc2InstanceConnect_Ec2InstanceConnectEndpoint" {
#   policy_arn = "arn:aws:iam::aws:policy/aws-service-role/Ec2InstanceConnectEndpoint"
#   role       = "AWSServiceRoleForEc2InstanceConnect"
# }
#
# resource "aws_iam_role_policy_attachment" "AWSServiceRoleForElastiCache_ElastiCacheServiceRolePolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/aws-service-role/ElastiCacheServiceRolePolicy"
#   role       = "AWSServiceRoleForElastiCache"
# }
#
# resource "aws_iam_role_policy_attachment" "AWSServiceRoleForElasticBeanstalk_AWSElasticBeanstalkServiceRolePolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSElasticBeanstalkServiceRolePolicy"
#   role       = "AWSServiceRoleForElasticBeanstalk"
# }
#
# resource "aws_iam_role_policy_attachment" "AWSServiceRoleForElasticLoadBalancing_AWSElasticLoadBalancingServiceRolePolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSElasticLoadBalancingServiceRolePolicy"
#   role       = "AWSServiceRoleForElasticLoadBalancing"
# }
#
# resource "aws_iam_role_policy_attachment" "AWSServiceRoleForGlobalAccelerator_AWSGlobalAcceleratorSLRPolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSGlobalAcceleratorSLRPolicy"
#   role       = "AWSServiceRoleForGlobalAccelerator"
# }
#
# resource "aws_iam_role_policy_attachment" "AWSServiceRoleForRDS_AmazonRDSServiceRolePolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonRDSServiceRolePolicy"
#   role       = "AWSServiceRoleForRDS"
# }
#
# resource "aws_iam_role_policy_attachment" "AWSServiceRoleForSupport_AWSSupportServiceRolePolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSSupportServiceRolePolicy"
#   role       = "AWSServiceRoleForSupport"
# }
#
# resource "aws_iam_role_policy_attachment" "AWSServiceRoleForTrustedAdvisor_AWSTrustedAdvisorServiceRolePolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSTrustedAdvisorServiceRolePolicy"
#   role       = "AWSServiceRoleForTrustedAdvisor"
# }
#
# resource "aws_iam_role_policy_attachment" "api_registry_role_AmazonEC2ContainerRegistryPowerUser" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
#   role       = "api_registry_role"
# }
#
# resource "aws_iam_role_policy_attachment" "aws-elasticbeanstalk-ec2-role_AWSElasticBeanstalkMulticontainerDocker" {
#   policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker"
#   role       = "aws-elasticbeanstalk-ec2-role"
# }
#
# resource "aws_iam_role_policy_attachment" "aws-elasticbeanstalk-ec2-role_AWSElasticBeanstalkWebTier" {
#   policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
#   role       = "aws-elasticbeanstalk-ec2-role"
# }
#
# resource "aws_iam_role_policy_attachment" "aws-elasticbeanstalk-ec2-role_AWSElasticBeanstalkWorkerTier" {
#   policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier"
#   role       = "aws-elasticbeanstalk-ec2-role"
# }
#
# resource "aws_iam_role_policy_attachment" "aws-elasticbeanstalk-ec2-role_AmazonEC2ContainerRegistryReadOnly" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
#   role       = "aws-elasticbeanstalk-ec2-role"
# }
#
# resource "aws_iam_role_policy_attachment" "aws-elasticbeanstalk-service-role_AWSElasticBeanstalkEnhancedHealth" {
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth"
#   role       = "aws-elasticbeanstalk-service-role"
# }
#
# resource "aws_iam_role_policy_attachment" "aws-elasticbeanstalk-service-role_AWSElasticBeanstalkManagedUpdatesCustomerRolePolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkManagedUpdatesCustomerRolePolicy"
#   role       = "aws-elasticbeanstalk-service-role"
# }
#
# resource "aws_iam_role_policy_attachment" "aws-elasticbeanstalk-service-role_AWSElasticBeanstalkService" {
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkService"
#   role       = "aws-elasticbeanstalk-service-role"
# }
#
# resource "aws_iam_role_policy_attachment" "ecsInstanceRole_AmazonEC2ContainerServiceforEC2Role" {
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
#   role       = "ecsInstanceRole"
# }
#
# resource "aws_iam_role_policy_attachment" "gitlab-ci-role_gitlab-ci-policy" {
#   policy_arn = "arn:aws:iam::211125588594:policy/gitlab-ci-policy"
#   role       = "gitlab-ci-role"
# }
#
# resource "aws_iam_role_policy_attachment" "rds-monitoring-role_AmazonRDSEnhancedMonitoringRole" {
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
#   role       = "rds-monitoring-role"
# }
#
# resource "aws_iam_role_policy_attachment" "ugdas-beanstalk-instance-role_AWSElasticBeanstalkMulticontainerDocker" {
#   policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker"
#   role       = "ugdas-beanstalk-instance-role"
# }
#
# resource "aws_iam_role_policy_attachment" "ugdas-beanstalk-instance-role_AWSElasticBeanstalkWebTier" {
#   policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
#   role       = "ugdas-beanstalk-instance-role"
# }
#
# resource "aws_iam_role_policy_attachment" "ugdas-beanstalk-service-role_AWSElasticBeanstalkEnhancedHealth" {
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth"
#   role       = "ugdas-beanstalk-service-role"
# }
#
# resource "aws_iam_user" "AIDATCKAQ2JZJCYO4MVBJ" {
#   force_destroy = "false"
#   name          = "ugdas-s3-user"
#   path          = "/"
# }
#
# resource "aws_iam_user" "AIDATCKAQ2JZOCBHQFAJU" {
#   force_destroy = "false"
#   name          = "gitlab-ci-user"
#   path          = "/"
#
#   tags = {
#     Environment = "prod"
#     Name        = "gitlab-ci-user"
#   }
#
#   tags_all = {
#     Environment = "prod"
#     Name        = "gitlab-ci-user"
#   }
# }
#
# resource "aws_iam_user" "AIDATCKAQ2JZPYWHPCDKG" {
#   force_destroy = "false"
#   name          = "devops"
#   path          = "/"
#
#   tags = {
#     AKIATCKAQ2JZEUKGNW6M = "vs code"
#     AKIATCKAQ2JZOZCRAEJW = "terraform"
#   }
#
#   tags_all = {
#     AKIATCKAQ2JZEUKGNW6M = "vs code"
#     AKIATCKAQ2JZOZCRAEJW = "terraform"
#   }
# }
#
# resource "aws_iam_user_group_membership" "devops-002F-devops" {
#   groups = ["devops"]
#   user   = "devops"
# }
#
# resource "aws_iam_user_group_membership" "ugdas-s3-user-002F-ugdas-s3-group" {
#   groups = ["ugdas-s3-group"]
#   user   = "ugdas-s3-user"
# }
#
# resource "aws_iam_user_policy" "gitlab-ci-user_gitlab-ci-user-policy" {
#   name = "gitlab-ci-user-policy"
#
#   policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": [
#         "elasticbeanstalk:CreateApplication",
#         "elasticbeanstalk:CreateEnvironment",
#         "elasticbeanstalk:UpdateEnvironment",
#         "elasticbeanstalk:TerminateEnvironment",
#         "elasticbeanstalk:DescribeEnvironments",
#         "elasticbeanstalk:DescribeApplicationVersions",
#         "s3:PutObject",
#         "s3:GetObject",
#         "s3:ListBucket",
#         "iam:ListAccessKeys"
#       ],
#       "Effect": "Allow",
#       "Resource": "*"
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
#
#   user = "gitlab-ci-user"
# }
#
resource "aws_iam_user_policy_attachment" "gitlab-ci-user_ecr-policy" {
  policy_arn = "arn:aws:iam::211125588594:policy/ecr-policy"
  user       = "gitlab-ci-user"
}
