###################################################
# Author: bfayty Date: 26/04/2022
# Version 1.0
#
# Description:
# 1 Database instance 1 Database subnet and 1 parameter group
###################################################

//Database instance creation
resource "aws_db_instance" "DBInstance" {
  allocated_storage    = var.allocated-storage
  engine               = var.engine
  engine_version       = var.engine-version
  instance_class       = var.instance-class
  name                 = var.db-instance-name
  username             = var.username
  password             = var.password
  parameter_group_name = var.db-pg-name
  skip_final_snapshot  = var.skip-final-shot
  db_subnet_group_name = aws_db_subnet_group.DBSubnet.name


  tags = {
        "name"    = var.db-instance-name
        "author"  = var.author
        "project" = var.project-name
    }
}

//Database subnet creation
resource "aws_db_subnet_group" "DBSubnet" {
    name = var.db-subnet-name
    subnet_ids = [var.subnet-id1,var.subnet-id2]
    
    tags = {
        "name"    = var.db-subnet-name
        "author"  = var.author
        "project" = var.project-name
    }
}

//parameter group creation
resource "aws_db_parameter_group" "db-instance-pg" {
  name   = var.db-pg-name
  family = var.engine-family

  parameter {
    name  = var.parameter-name
    value = var.parameter-value
  }
}