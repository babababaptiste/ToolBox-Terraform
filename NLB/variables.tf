###################################################
# Author: bfayty Date: 04/05/2022
# Version : 1.0
#
# Description:
# Variables for Load Balancer, LB Listener, LB Target Group, AutoScalling Group, Launch Template and Providers
#
# Variables list :
# VARIABLE NAME                                    : DESCRIPTION                                 | TYPE
#--------------------------------------------------:---------------------------------------------|-------
# access_key (Providers)                           : Access Key ID                               | String
# secret_key (Providers)                           : Secret Key ID                               | String
# region (Providers)                               : Name of the Region. By default "us-west-2"  | String
# lb-name (Load Balancer)                          : Name for your Load Balancer                 | String
# load-balancer-type (Load Balancer)               : Type of Load Balancer(Network for this one) | String
# subnets (Load Balancer)                          : Id of the 2 Subnets                         | list(String)
# lb-port-listener (Load Balancer Listener)        : Port for the Listener                       | Number
# lb-protocol-listener (Load Balancer Listener)    : Protocol for the Listener                   | String
# lb-listener-action-type (Load Balancer Listener) : Action to perform for the Listener          | String
# lb-port-target (Load Balancer Listener)          : Port for the Target Group                   | Number
# lb-protocol-target (Load Balancer Target Group)  : Protocol for the Target Group               | String
# lb-tg-group (Load Balancer Target Group)         : Name for the Target Group                   | String
# vpc-id (Load Balancer Target Group)              : Id of your VPC                              | String
# asg-name (AutoScalling Group)                    : Name for the AutoScalling Group             | String
# max (AutoScalling Group)                         : Max number of instance                      | Number
# min (AutoScalling Group)                         : Min number of instance                      | Number
# desired (AutoScalling Group)                     : Desired number of instance                  | Number
# port-tg (Target group attachement)               : Port for the Target Group Attachement       | Number
# instance-name (Launch Template)                  : Name for the instance                       | String
# image-id (Launch Template)                       : AMI id for the instance                     | String
# instance-type (Launch Template)                  : Type of instance                            | String
# security-group (Launch Template)                 : Id of the Security Groups                   | String
# key-name (Launch Template)                       : Name of your Key Pair                       | String
# project (Tags)                                   : Name of your project                        | String
# author (Tags)                                    : Name of the author                          | String
###################################################
###Providers###
variable "access-key" {
    description = "id of your access key"
    type        = string
    default     = ""
}

variable "secret-key" {
    description = "id of your secret key"
    type        = string
    default     = ""
}

variable "region" {
    description = "name of your region"
    type        = string
    default     = "us-west-2"
}

###Load Balancer###
variable "lb-name" {
    description = "name for your load balancer"
    type        = string
    default     = ""
}

variable "load-balancer-type" {
    description = "Type of Load Balancer(Network for this one)"
    type    = string
    default = "network"
}

variable "subnets" {
    description = "id of the 2 subnets"
    type        = list(string)
    default     = ["", ""]
}

###Load Balancer Listener###
variable "lb-port-listener" {
    description = "port for the listener"
    type = number
    default = 443
}

variable "lb-protocol-listener" {
    description = "protocol for the listener"
    type = string
    default = "TCP"
}

variable "lb-listener-action-type" {
    description = "type of action to perform"
    type = string
    default = "forward"  
}

###Load Balancer Target Group###
variable "lb-port-target" {
    description = "port for the target group"
    type = number
    default = 443
}

variable "lb-protocol-target" {
    description = "protocol for the target group"
    type = string
    default = "TCP"
}

variable "lb-tg-group" {
    description = "name for the target group"
    type = string
    default = ""  
}

variable "vpc-id" {
    description = "id of your VPC"
    type    = string
    default = ""
}

###AutoScalling Group###
variable "asg-name" {
    description = "name for your autoscalling group"
    type        = string
    default     = ""
}

variable "max"{
    description = "max number of instance"
    type = number
    default = 1
}

variable "min"{
    description = "min number of instance"
    type = number
    default = 1
}

variable "desired"{
    description = "desired number of instance"
    type = number
    default = 1
}

###Target group attachement###
variable "port-tg" {
    description = "port for the target group attachement"
    type = number
    default = 443  
}

###Launch Template###
variable "instance-name" {
    description = "name for the instance"
    type    = string
    default = ""
}

variable "image-id" {
    description = "ami id for the instance"
    type = string
    default = ""
}

variable "instance-type" {
    description = "type of the instance"
    type = string
    default = ""
}

variable "security-group" {
    description = "id of the security groups"
    type        = string
    default     = ""
}

variable "key-name" {
    description = "name of your key pair"
    type = string
    default = ""
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