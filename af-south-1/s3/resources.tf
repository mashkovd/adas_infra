resource "aws_s3_bucket" "admin-002E-das-002E-ug" {
  bucket        = "admin.das.ug"
  force_destroy = "false"

  object_lock_enabled = "false"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "s3:GetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Resource": "arn:aws:s3:::admin.das.ug/*",
      "Sid": "PublicReadGetObject"
    }
  ],
  "Version": "2012-10-17"
}
POLICY


}

resource "aws_s3_bucket" "das-002E-ug" {
  bucket        = "das.ug"
  force_destroy = "false"



  object_lock_enabled = "false"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "s3:GetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Resource": "arn:aws:s3:::das.ug/*",
      "Sid": "PublicReadGetObject"
    }
  ],
  "Version": "2012-10-17"
}
POLICY


}

resource "aws_s3_bucket" "das-media" {
  bucket        = "das-media"
  force_destroy = "false"


  object_lock_enabled = "false"

}

resource "aws_s3_bucket" "elasticbeanstalk-af-south-1-211125588594" {
  bucket        = "elasticbeanstalk-af-south-1-211125588594"
  force_destroy = "false"



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



}

resource "aws_s3_bucket" "eposta-integration-002E-das-002E-ug" {
  bucket        = "eposta-integration.das.ug"
  force_destroy = "false"



  object_lock_enabled = "false"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "s3:GetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Resource": "arn:aws:s3:::eposta-integration.das.ug/*",
      "Sid": "PublicReadGetObject"
    }
  ],
  "Version": "2012-10-17"
}
POLICY



}

resource "aws_s3_bucket" "platform-002E-zaidi-002E-ug" {
  bucket        = "platform.zaidi.ug"
  force_destroy = "false"


  object_lock_enabled = "false"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "s3:GetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Resource": "arn:aws:s3:::platform.zaidi.ug/*",
      "Sid": "PublicReadGetObject"
    }
  ],
  "Version": "2012-10-17"
}
POLICY


  website {
    index_document = "index.html"
    error_document = "index.html"
  }


}

resource "aws_s3_bucket_website_configuration" "platform_website" {
  bucket = aws_s3_bucket.platform-002E-zaidi-002E-ug.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket" "ugdas" {
  bucket        = "ugdas"
  force_destroy = "false"



  object_lock_enabled = "false"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:PutObject",
        "s3:GetObjectAcl",
        "s3:GetObject",
        "s3:ListBucket",
        "s3:DeleteObject",
        "s3:PutObjectAcl"
      ],
      "Effect": "Allow",
      "Principal": "*",
      "Resource": [
        "arn:aws:s3:::ugdas/*",
        "arn:aws:s3:::ugdas"
      ],
      "Sid": "Stmt1637791997302"
    }
  ],
  "Version": "2012-10-17"
}
POLICY


}

resource "aws_s3_bucket" "ugdas-initial-backup" {
  bucket              = "ugdas-initial-backup"
  force_destroy       = "false"
  object_lock_enabled = "false"

}

resource "aws_s3_bucket" "zaidi-002E-ug" {
  bucket        = "zaidi.ug"
  force_destroy = "false"



  object_lock_enabled = "false"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "s3:GetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Resource": "arn:aws:s3:::zaidi.ug/*",
      "Sid": "PublicReadGetObject"
    }
  ],
  "Version": "2012-10-17"
}
POLICY


}

resource "aws_s3_bucket_policy" "admin-002E-das-002E-ug" {
  bucket = "admin.das.ug"
  policy = "{\"Statement\":[{\"Action\":\"s3:GetObject\",\"Effect\":\"Allow\",\"Principal\":\"*\",\"Resource\":\"arn:aws:s3:::admin.das.ug/*\",\"Sid\":\"PublicReadGetObject\"}],\"Version\":\"2012-10-17\"}"
}

resource "aws_s3_bucket_policy" "das-002E-ug" {
  bucket = "das.ug"
  policy = "{\"Statement\":[{\"Action\":\"s3:GetObject\",\"Effect\":\"Allow\",\"Principal\":\"*\",\"Resource\":\"arn:aws:s3:::das.ug/*\",\"Sid\":\"PublicReadGetObject\"}],\"Version\":\"2012-10-17\"}"
}

resource "aws_s3_bucket_policy" "elasticbeanstalk-af-south-1-211125588594" {
  bucket = "elasticbeanstalk-af-south-1-211125588594"
  policy = "{\"Statement\":[{\"Action\":\"s3:DeleteBucket\",\"Effect\":\"Deny\",\"Principal\":{\"AWS\":\"*\"},\"Resource\":\"arn:aws:s3:::elasticbeanstalk-af-south-1-211125588594\",\"Sid\":\"eb-58950a8c-feb6-11e2-89e0-0800277d041b\"},{\"Action\":\"s3:PutObject\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::211125588594:role/aws-elasticbeanstalk-ec2-role\"},\"Resource\":\"arn:aws:s3:::elasticbeanstalk-af-south-1-211125588594/resources/environments/logs/*\",\"Sid\":\"eb-ad78f54a-f239-4c90-adda-49e5f56cb51e\"},{\"Action\":[\"s3:ListBucket\",\"s3:ListBucketVersions\",\"s3:GetObject\",\"s3:GetObjectVersion\"],\"Effect\":\"Allow\",\"Principal\":{\"AWS\":[\"arn:aws:iam::211125588594:role/ecsInstanceRole\",\"arn:aws:iam::211125588594:role/aws-elasticbeanstalk-ec2-role\"]},\"Resource\":[\"arn:aws:s3:::elasticbeanstalk-af-south-1-211125588594\",\"arn:aws:s3:::elasticbeanstalk-af-south-1-211125588594/resources/environments/*\"],\"Sid\":\"eb-af163bf3-d27b-4712-b795-d1e33e331ca4\"}],\"Version\":\"2008-10-17\"}"
}

resource "aws_s3_bucket_policy" "eposta-integration-002E-das-002E-ug" {
  bucket = "eposta-integration.das.ug"
  policy = "{\"Statement\":[{\"Action\":\"s3:GetObject\",\"Effect\":\"Allow\",\"Principal\":\"*\",\"Resource\":\"arn:aws:s3:::eposta-integration.das.ug/*\",\"Sid\":\"PublicReadGetObject\"}],\"Version\":\"2012-10-17\"}"
}

resource "aws_s3_bucket_policy" "platform-002E-zaidi-002E-ug" {
  bucket = "platform.zaidi.ug"
  policy = "{\"Statement\":[{\"Action\":\"s3:GetObject\",\"Effect\":\"Allow\",\"Principal\":\"*\",\"Resource\":\"arn:aws:s3:::platform.zaidi.ug/*\",\"Sid\":\"PublicReadGetObject\"}],\"Version\":\"2012-10-17\"}"
}

resource "aws_s3_bucket_policy" "ugdas" {
  bucket = "ugdas"
  policy = "{\"Statement\":[{\"Action\":[\"s3:PutObject\",\"s3:GetObjectAcl\",\"s3:GetObject\",\"s3:ListBucket\",\"s3:DeleteObject\",\"s3:PutObjectAcl\"],\"Effect\":\"Allow\",\"Principal\":\"*\",\"Resource\":[\"arn:aws:s3:::ugdas/*\",\"arn:aws:s3:::ugdas\"],\"Sid\":\"Stmt1637791997302\"}],\"Version\":\"2012-10-17\"}"
}

resource "aws_s3_bucket_policy" "zaidi-002E-ug" {
  bucket = "zaidi.ug"
  policy = "{\"Statement\":[{\"Action\":\"s3:GetObject\",\"Effect\":\"Allow\",\"Principal\":\"*\",\"Resource\":\"arn:aws:s3:::zaidi.ug/*\",\"Sid\":\"PublicReadGetObject\"}],\"Version\":\"2012-10-17\"}"
}
