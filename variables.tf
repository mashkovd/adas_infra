variable "hcloud_token" {
  type        = string
  description = "The Hetzner Cloud API token"
  sensitive   = true

}

variable "aws_region" {
  description = "The AWS region to deploy the infrastructure in"
  type        = string
  default     = "eu-north-1"
}

variable "access_key" {
  type        = string
  description = "The AWS access key"
  sensitive   = true
}

variable "secret_key" {
  type        = string
  description = "The AWS secret key"
  sensitive   = true
}


variable "ssh_public_key" {
  description = "Path to the SSH public key"
  type        = string
  sensitive   = true
}

variable "ssh_private_key" {
  description = "Path to the SSH private key"
  type        = string
  sensitive   = true
}

variable "gitlab_runner_registration_token" {
  description = "GitLab Runner registration token"
  type        = string
  sensitive   = true
}

variable "gitlab_url" {
  description = "GitLab instance URL"
  type        = string
}

variable "gitlab_pat" {
  description = "GitLab Personal Access Token"
  type        = string
}