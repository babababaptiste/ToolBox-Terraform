resource "aws_security_group" "web-pub-sg" {
    name        = "allow_web_access"
    description = "allow inbound traffic"
    vpc_id      = aws_vpc.this.id
    
    ingress {
        description      = "TLS from VPC"
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    
    tags = {
        "Name"    = "security-group"
        "author"  = var.author
        "project" = var.project
    }
}

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

resource "aws_instance" "Instance2" {
    instance_type               = var.instance_type
    ami                         = data.aws_ami.ami-id.id
    vpc_security_group_ids      = [aws_security_group.web-pub-sg.id]
    subnet_id                   = aws_subnet.public.id
    associate_public_ip_address = "true"
    tags = {
        "Name"    = var.instance-name
        "author"  = var.author
        "project" = var.project
        }
}