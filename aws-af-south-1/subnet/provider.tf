provider "aws" {
  region = "af-south-1"
}

terraform {
	required_providers {
		aws = {
	    version = "~> 3.76.1"
		}
  }
}
