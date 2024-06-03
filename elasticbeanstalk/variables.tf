
variable "app_name" {
  description = "The name of the Elastic Beanstalk application"
  type        = string
  default     = "ugdas"
}

variable "environment_name" {
  description = "The name of the Elastic Beanstalk environment"
  type        = string
  default     = "ugdas-env"
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket for Elastic Beanstalk"
  type        = string
  default     = "ugdas-s3-bucket"
}

variable "ecr_repository_name" {
  description = "The name of the ECR repository"
  type        = string
  default     = "ugdas-ecr-repo"
}
