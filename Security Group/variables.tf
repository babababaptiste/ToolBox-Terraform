###################################################
# Author: bfayty Date: 02/05/2022
# Version : 1.0
#
# Description:
# Variables for Security Group
#
# Variables list :
# VARIABLE NAME                       : DESCRIPTION                                                                  | TYPE     
#-------------------------------------:------------------------------------------------------------------------------|-------
# access_key (Providers)              : Access Key ID                                                                | String
# secret_key (Providers)              : Secret Access Key ID                                                         | String
# region (Providers)                  : Name of the region. By default "us-west-2"                                   | String
# vpc-id (Security Group)             : id of your vpc                                                               | String
# SG-name (Security Group)            : Name for your security group                                                 | String
# SG-description (Security Group)     : Description for your security group                                          | String
# Ingress-protocol (Security Group)   : Ingress protocole for your security group                                    | String 
# Egress-protocol (Security Group)    : Egress protocole for your security group                                     | String
# private_ip_address (Security Group) : Private Ip adress. If you leave it empty it will assign you a default one    | String
# OSname (Security Group)             : Name of your OS (windows or Linux)                                           | String
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

###VPC###
variable "vpc-id" {
    description = "id of your vpc"
    type        = string
    default     = ""  
}

###Security group###
variable "SG-name" {
    description = "Name for your security group"
    type        = string
    default     = ""
}

variable "SG-description" {
    description = "Description for your security group"
    type        = string
    default     = "allow inbound traffic"  
}

variable "Ingress-protocol" {
    description = "Ingress protocole for your security group (Valid values : tcp, udp, icmp, icmpv6. Use -1 to to specify all protocols)"
    type        = string
    default     = ""
}

variable "Egress-protocol" {
    description = "Egress protocole for your security group (Valid values : tcp, udp, icmp, icmpv6. Use -1 to to specify all protocols)"
    type        = string
    default     = ""
}

variable "private_ip_address" {
    description = "If not set the ip is automatically set"
    type        = string
    default     = "" 
}

variable "OSname" {
    description = "name of your OS"
    type        = string
    default     = "" //Windows or Linux
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