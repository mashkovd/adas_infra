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

# module "elasticbeanstalk" {
#   source = "./elasticbeanstalk"
# }
