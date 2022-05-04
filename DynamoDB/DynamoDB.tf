###################################################
# Author: bfayty Date: 29/04/2022
# Version : 1.0
#
# Description:
# 1 DynamoDB table with 1 primary key and 1 secondary key
# primary key : hash_key
# secondary key : range_key 
###################################################

resource "aws_dynamodb_table" "DynamoDBTable" {
  name           = var.dynamodb-name
  billing_mode   = var.billing-mode
  read_capacity  = var.read-capacity
  write_capacity = var.write-capacity
  hash_key       = var.primary-key-name
  range_key      = var.secondary-key-name

  attribute {
    name = var.primary-key-name
    type = var.primary-key-type
  }

  attribute {
    name = var.secondary-key-name
    type = var.secondary-key-type
  }

  server_side_encryption { 
    enabled = true 
    kms_key_arn = var.kms-key-arn
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = var.ttl-enabled
  }

  tags = {
        "name"    = var.dynamodb-name
        "author"  = var.author
        "project" = var.project-name
    }
}