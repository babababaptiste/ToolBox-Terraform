###################################################
# Author: bfayty 
# Date: 04/05/2022
# Version 1.0
#
# Description:
# Providers for AWS and Terraform
###################################################
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.9.0"
    }
  }
}

provider "aws" {
    access_key = var.access-key
    secret_key = var.secret-key
    region     = var.region
}