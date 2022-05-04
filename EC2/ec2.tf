###################################################
# Author: bfayty Date: 26/04/2022
# Version : 1.0
#
# Description:
# 1 EC2 with 1 AMI and 1 Key Pair 
###################################################

//Function to find an Amazon AMI
data "aws_ami" "ami-id" {
  filter {
    name   = "name"
    values = [var.ami-request]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  most_recent = true
  owners      = ["amazon"]
}

//EC2 instance creation
resource "aws_instance" "Instance" {
    instance_type               = var.instance_type
    ami                         = var.ami-id == "" ? data.aws_ami.ami-id.id : var.ami-id
    vpc_security_group_ids      = [var.security-group-id] 
    subnet_id                   = var.subnet_id
    key_name                    = var.keyName
    associate_public_ip_address = "true"
    tags = {
        "Name"    = var.instance-name
        "author"  = var.author
        "project" = var.project
        }
}