###################################################
# Author: bfayty Date: 26/04/2022
# Version 1.0
#
# Description:
# 1 S3 Bucket, 1 Access Control List and 1 kms key
###################################################

//AWS S3 Bucket creation
resource "aws_s3_bucket" "bucket" {
    bucket = var.bucket-name

    tags = {
        "name"    = var.bucket-name
        "author"  = var.author
        "project" = var.project-name
    }
}

resource "aws_s3_bucket_acl" "bucket-acl" {
  bucket = aws_s3_bucket.bucket.bucket
  acl    = "private"
}

#################################AWS Key##################################

//AWS KMS Key creation
resource "aws_kms_key" "new-key" {
    count = var.kms_master_key_id == "" ? 1 : 0
    description = "kms key for s3 bucket"
}

//Store localy the key arn
locals {
    awsKmsKeyId = join("",aws_kms_key.new-key[*].arn)
}

//S3 Bucket server side encryption configuration
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket-sse" {
    bucket = aws_s3_bucket.bucket.bucket

    rule {
        apply_server_side_encryption_by_default {
            kms_master_key_id = "${var.kms_master_key_id != "" ?  var.kms_master_key_id : local.awsKmsKeyId}"
            sse_algorithm     = var.sse_algorithm
        }
    }
}

##########################################################################