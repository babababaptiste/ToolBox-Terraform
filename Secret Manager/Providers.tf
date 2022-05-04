###################################################
# Author: bfayty 
# Date: 29/04/2022
# Version 1.0
#
# Description:
# Providers for AWS, tls and Terraform
###################################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region     = var.region
}

provider "tls" {
  proxy {
    from_env = true
  }
} 