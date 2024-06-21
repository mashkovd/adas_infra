resource "aws_ecr_repository" "ugdas_backend" {
  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = "false"
  }

  image_tag_mutability = "IMMUTABLE"
  name                 = "ugdas_backend"
}

resource "aws_ecr_repository" "ugdas_flower" {
  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = "false"
  }

  image_tag_mutability = "IMMUTABLE"
  name                 = "ugdas_flower"
}

resource "aws_ecr_repository" "ugdas_celery" {
  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = "false"
  }

  image_tag_mutability = "IMMUTABLE"
  name                 = "ugdas_celery"
}