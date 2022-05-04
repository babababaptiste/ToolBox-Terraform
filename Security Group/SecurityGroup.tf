###################################################
# Author: bfayty Date: 02/05/2022
# Version : 1.0
#
# Description:
# 1 Security Group
###################################################
//Security Group creation
resource "aws_security_group" "security-group" {
    name        = var.SG-name
    description = var.SG-description
    vpc_id      = var.vpc-id
    
    //Ingress specifications
    ingress {
        description      = "TLS from VPC"
        from_port        = var.OSname == "Windows" ? 443 : 22
        to_port          = var.OSname == "Windows" ? 443 : 22
        protocol         = var.Ingress-protocol
        cidr_blocks      = [data.aws_vpc.VPC.cidr_block]
    }

    //Egress specifications
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = var.Egress-protocol
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    
    tags = {
        "Name"    = var.SG-name
        "author"  = var.author
        "project" = var.project
    }
}

data "aws_vpc" "VPC" {
    id = var.vpc-id
}