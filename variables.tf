variable "hcloud_token" {
  type        = string
  description = "The Hetzner Cloud API token"
  sensitive   = true

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

variable "gitlab_runner_registration_token" {
  description = "GitLab Runner registration token"
  type        = string
  sensitive   = true
}

variable "gitlab_url" {
  description = "GitLab instance URL"
  type        = string
}