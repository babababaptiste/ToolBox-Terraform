###################################################
# Author: bfayty Date: 26/04/2022
# Version 1.0
#
# Description:
# Variables for S3 Bucket, Access Control List and Providers
#
# Variables list :
# VARIABLE NAME               : DESCRIPTION                                                                      | TYPE
#-----------------------------:----------------------------------------------------------------------------------|-------
# access_key (Providers)      : Access Key ID                                                                    | String
# private_key (Providers)     : Private Key ID                                                                   | String
# region (Providers)          : Region name. By default us-west-2                                                | String
# bucket-name (Bucket)        : Name of the bucket                                                               | String
# kms_master_key_id (KMS Key) : Id of your kms key. If you want to create a new key leave this variable empty    | String
# sse_algorithm (KMS Key)     : The server-side encryption algorithm to use. Valid values are AES256 and aws:kms | String
# author (Tags)               : Name of the author                                                               | String
# project-name (Tags)         : Name of the project                                                              | String
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
  type    = string
  default = "us-west-2" //For Oregon : us-west-2
}

###Bucket###
variable "bucket-name" {
  description = "Name of the bucket"
  type    = string
  default = ""
}


###KMS Key###
variable "kms_master_key_id" {
  description = "id of your kms key. If you want to create a new key leave this variable empty"
  type        = string
  default     = "" 
}

variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
  type        = string
  default     = ""
}

###Tags###
variable "author" {
  description = "Name of the author"
  type    = string
  default = ""
}

variable "project-name" {
  description = "Name of the project"
  type    = string
  default = ""
}