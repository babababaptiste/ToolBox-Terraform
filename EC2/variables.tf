###################################################
# Author: bfayty Date: 26/04/2022
# Version : 1.0
#
# Description:
# Variables for EC2, AMI, Providers
# Secrets Manager And Key pair
#
# Variables list :
# VARIABLE NAME                       : DESCRIPTION                                                                  | TYPE     
#-------------------------------------:------------------------------------------------------------------------------|-------
# access_key (Providers)              : Access Key ID                                                                | String
# secret_key (Providers)              : Secret Access Key ID                                                         | String
# region (Providers)                  : Name of the region. By default "us-west-2"                                   | String
# security-group-id (Security Group)  : ID of your Security group                                                    | String
# ami-request (AMI)                   : AMI name to request                                                          | String
# ami-id (AMI)                        : ID of your existing AMI                                                      | String
# instance_type (EC2)                 : Type of instance to launch                                                   | String
# subnet_id (EC2)                     : ID of your existing subnet                                                   | String
# instance-name (EC2)                 : Name for the instance                                                        | String
# keyName (EC2)                       : Name for the existing Key Pair                                               | String
# project (Tags)                      : Name for the project                                                         | String
# author (Tags)                       : Name for the author                                                          | String
###################################################

###Providers###
variable "access_key" {
    description = "Access Key ID"
    type        = string
    default     = ""
    sensitive   = true
}

variable "secret_key" {
    description = "Secret Access Key"
    type        = string
    default     = "" 
    sensitive   = true
}

variable "region" {
    description = "region to deploy your EC2"
    type        = string
    default     = "us-west-2" 
}

###Security group###
variable "security-group-id" {
    description = "id of your security group"
    type        = string
    default     = ""
}

###AMI###
variable "ami-request" {
    type    = string
    default = "" //AMI name for Windows : Windows_Server-2019-English-Full-Base-2022.01.12*
}

variable "ami-id" {
    description = "id of your AMI "
    type        = string
    default     = "" //If you don't have a specific AMI leave this variable empty and use the ami-request variable
}

###EC2###
variable "instance_type" {
    description = "type of instance you want to launch"
    type        = string
    default     = "" //To see all instance types : https://aws.amazon.com/fr/ec2/instance-types/
}

variable "instance-name" {
    description = "define a name for your instance"
    type        = string
    default     = "" 
}

variable "keyName" {
    description = "Name of your Key Pair" 
    type        = string
    default     = ""
}

variable "subnet_id" {
    description = "Id of your subnet"
    type        = string
    default     = ""
}

###Tags###
variable "project" {
    description = "name of your project"
    type        = string
    default     = "" 
}

variable "author" {
    description = "name of the author"
    type        = string
    default     = "" 
}