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

variable "pipeLine-name" {
    type    = string
    default = ""
}

variable "author" {
    type    = string
    default = ""
}

variable "project-name" {
    type    = string
    default = ""
}

variable "repository-name" {
    type    = string
    default = ""
}

variable "role-arn" {
    type = string
    default = ""
}


variable "bucket-name" {
    type = string
    default = ""
}

variable "branchName" {
    type = string
    default = ""
}

#################################AWS Key##################################
/*
variable "kms_master_key_id" {
  type        = string
  default     = ""
}*/

variable "bucket_key_enabled" {
  description = "Whether or not to use Amazon S3 Bucket Keys for SSE-KMS."
  type        = bool
  default     = true
}

##########################################################################

##############################Generated Key###############################

variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
  type        = string
  default     = ""
}

##########################################################################