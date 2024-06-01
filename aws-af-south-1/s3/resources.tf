resource "aws_s3_bucket" "das-media" {
  arn                 = "arn:aws:s3:::das-media"
  bucket              = "das-media"
  force_destroy       = "false"
  hosted_zone_id      = "Z83WF9RJE8B12"
  object_lock_enabled = "false"
}

resource "aws_s3_bucket_public_access_block" "das-media" {
  bucket = aws_s3_bucket.das-media.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "elasticbeanstalk-af-south-1-211125588594" {
  arn                 = "arn:aws:s3:::elasticbeanstalk-af-south-1-211125588594"
  bucket              = "elasticbeanstalk-af-south-1-211125588594"
  force_destroy       = "false"
  hosted_zone_id      = "Z83WF9RJE8B12"
  object_lock_enabled = "false"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "s3:DeleteBucket",
      "Effect": "Deny",
      "Principal": {
        "AWS": "*"
      },
      "Resource": "arn:aws:s3:::elasticbeanstalk-af-south-1-211125588594",
      "Sid": "eb-58950a8c-feb6-11e2-89e0-0800277d041b"
    },
    {
      "Action": "s3:PutObject",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::211125588594:role/aws-elasticbeanstalk-ec2-role"
      },
      "Resource": "arn:aws:s3:::elasticbeanstalk-af-south-1-211125588594/resources/environments/logs/*",
      "Sid": "eb-ad78f54a-f239-4c90-adda-49e5f56cb51e"
    },
    {
      "Action": [
        "s3:ListBucket",
        "s3:ListBucketVersions",
        "s3:GetObject",
        "s3:GetObjectVersion"
      ],
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:iam::211125588594:role/aws-elasticbeanstalk-ec2-role",
          "arn:aws:iam::211125588594:role/ecsInstanceRole"
        ]
      },
      "Resource": [
        "arn:aws:s3:::elasticbeanstalk-af-south-1-211125588594",
        "arn:aws:s3:::elasticbeanstalk-af-south-1-211125588594/resources/environments/*"
      ],
      "Sid": "eb-af163bf3-d27b-4712-b795-d1e33e331ca4"
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  request_payer = "BucketOwner"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }

      bucket_key_enabled = "false"
    }
  }

  versioning {
    enabled    = "false"
    mfa_delete = "false"
  }
}

resource "aws_s3_bucket_policy" "elasticbeanstalk-af-south-1-211125588594" {
  bucket = "elasticbeanstalk-af-south-1-211125588594"
  policy = "{\"Statement\":[{\"Action\":\"s3:DeleteBucket\",\"Effect\":\"Deny\",\"Principal\":{\"AWS\":\"*\"},\"Resource\":\"arn:aws:s3:::elasticbeanstalk-af-south-1-211125588594\",\"Sid\":\"eb-58950a8c-feb6-11e2-89e0-0800277d041b\"},{\"Action\":\"s3:PutObject\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::211125588594:role/aws-elasticbeanstalk-ec2-role\"},\"Resource\":\"arn:aws:s3:::elasticbeanstalk-af-south-1-211125588594/resources/environments/logs/*\",\"Sid\":\"eb-ad78f54a-f239-4c90-adda-49e5f56cb51e\"},{\"Action\":[\"s3:ListBucket\",\"s3:ListBucketVersions\",\"s3:GetObject\",\"s3:GetObjectVersion\"],\"Effect\":\"Allow\",\"Principal\":{\"AWS\":[\"arn:aws:iam::211125588594:role/ecsInstanceRole\",\"arn:aws:iam::211125588594:role/aws-elasticbeanstalk-ec2-role\"]},\"Resource\":[\"arn:aws:s3:::elasticbeanstalk-af-south-1-211125588594\",\"arn:aws:s3:::elasticbeanstalk-af-south-1-211125588594/resources/environments/*\"],\"Sid\":\"eb-af163bf3-d27b-4712-b795-d1e33e331ca4\"}],\"Version\":\"2008-10-17\"}"
}
