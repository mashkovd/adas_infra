# outputs.tf
output "beanstalk_application_name" {
  value = aws_elastic_beanstalk_application.beanstalk_app.name
}

output "beanstalk_environment_name" {
  value = aws_elastic_beanstalk_environment.beanstalk_env.name
}

output "s3_bucket_name" {
  value = aws_s3_bucket.beanstalk_bucket.bucket
}

output "ecr_repository_url" {
  value = aws_ecr_repository.ecr_repo.repository_url
}
