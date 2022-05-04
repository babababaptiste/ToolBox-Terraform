variable "access_key" {
    type      = string
    default   = "" //Access Key ID
    sensitive = true
}

variable "secret_key" {
    type      = string
    default   = "" //Secret Access Key
    sensitive = true
}

variable "region" {
    type    = string
    default = "" //For Oregon : us-west-2
}

variable "private_ip_address" {
    type    = string
    default = "" //Leave empty
}

variable "author" {
    type    = string
    default = "" //Name of the author
}

variable "instance_type" {
    type    = string
    default = "" //Instance type
}

variable "project" {
    type    = string
    default = "" //Project name
}

variable "ami-request" {
    type    = string
    default = "" //AMI name for Windows : Windows_Server-2019-English-Full-Base-2022.01.12*
}

variable "instance-name" {
    type    = string
    default = "" //Name for the instance
}

variable "vpc-name" {
    type = string
    default = ""
}

variable "route-table-name" {
    type = string
    default = ""
}

variable "igw-name" {
    type = string
    default = ""
}

variable "NI-name" {
    type = string
    default = ""
}

variable "ipo-name" {
    type = string
    default = ""
}