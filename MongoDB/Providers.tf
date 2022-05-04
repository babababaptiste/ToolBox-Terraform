terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }

    mongodbatlas = {
      source = "mongodb/mongodbatlas"
      version = "1.3.1"
    }
  }
}

provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region     = var.region
}

provider "mongodbatlas" {
  public_key  = var.public_key
  private_key = var.private_key
}