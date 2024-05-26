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