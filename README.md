# ADAS Project Infrastructure

This project sets up infrastructure for the ADAS project on Hetzner Cloud and saves state in an S3 bucket.

## Setup

1. Install Terraform. See the [official site](https://learn.hashicorp.com/tutorials/terraform/install-cli) for instructions.

2. Copy `variables.tf.example` to `terraform.tfvars` and set your `hcloud_token`.

3. Initialize Terraform with your AWS access key and secret key:

```bash
terraform init -backend-config="access_key=your_access_key" -backend-config="secret_key=your_secret_key"
```

## Usage

To see what will be created, updated, or deleted, run:

```bash
terraform plan
```

To create all resources, run:

```bash 
terraform apply
```

To destroy all resources, run:

```bash
terraform destroy
```


    