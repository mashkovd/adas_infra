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
    bucket     = "adas-infra"
    key        = "terraform-state"
    region     = "eu-north-1"
  }
}


provider "hcloud" {
  token = var.hcloud_token
}

provider "aws" {
  region     = "eu-north-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "hcloud_server" "s_1" {

  name        = "dev"
  image       = "ubuntu-20.04"
  server_type = "cx11"
  datacenter  = "fsn1-dc14"

}

resource "aws_s3_bucket" "infra_bucket" {
  bucket = "adas-infra"

  tags = {
    Name        = "adas-infra-bucket"
    Environment = "dev"
  }
}
