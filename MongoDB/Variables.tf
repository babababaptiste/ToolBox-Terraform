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

variable "author" {
    type    = string
    default = "" //Name of the author
}

variable "project" {
    type    = string
    default = "" //Project name
}

variable "vpc-name" {
    type    = string
    default = ""
}

variable "vpc-id" {
    type    = string
    default = ""
}

variable "aws_account_id" {
  description = "My AWS Account ID"
  default     = ""
}

########### MongoDB Atlas variables ###########

variable "cluster-size-name" {
    type    = string
    default = ""
}

variable "atlasorgid" {
  description = "Atlas Org ID"
  default     = ""
}

variable "atlas_dbuser" {
  description = "The db user for Atlas"
}

variable "atlas_dbpassword" {
  description = "The db user passwd for Atlas"
}

variable "atlas_vpc_cidr" {
  description = "Atlas CIDR"
  default     = ""
}

variable "atals-project-name" {
    type    = string
    default = ""
}

variable "atlas-cluster-name" {
    type    = string
    default = ""  
}

variable "public_key" {
    type        = string
    default     = ""
    description = "value of the mongoDB public key"  
}

variable "private_key" {
    type        = string
    default     = ""
    description = "value of the mongoDB private key"  
}