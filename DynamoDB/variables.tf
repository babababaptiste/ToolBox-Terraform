###################################################
# Author: bfayty Date: 29/04/2022
# Version 1.0
#
# Description:
# Variables for DynamoDB and Providers
#
# Variables list :
# access_key (Providers)        : Access Key ID                                                                          | String
# private_key (Providers)       : Private Key ID                                                                         | String
# region (Providers)            : Name of the region. By default "us-west-2"                                             | String
# dynamodb-name (DynamoDB)      : Name for the DynamoDB table                                                            | String
# user-id (DynamoDB)            : ID of the User                                                                         | String
# primary-key-name (DynamoDB)   : Name of the primary key                                                                | String
# secondary-key-name (DynamoDB) : Name of the secondary key                                                              | String
# primary-key-type (DynamoDB)   : Type of the primary key                                                                | String
# secondary-key-type (DynamoDB) : Type of the secondary key                                                              | String
# read-capacity (DynamoDB)      : Read capacity for your table. S for String, N for number, B for binary                 | number
# write-capacity (DynaomDB)     : Write capacity for your table. S for String, N for number, B for binary                | number
# billing-mode (DynamoDB)       : Controls how you are charged for read and write throughput and how you manage capacity | String
# kms-key-arn (DynamoDB)        : kms key arn for the server side encryption                                             | String
# ttl-enabled (DynamoDB)        : time to live. True to able                                                             | bool
# author (Tags)                 : Name of the author                                                                     | String
# project-name (Tags)           : Name of the project                                                                    | String
###################################################

###Providers###
variable "access_key" {
    description = "Access Key ID"
    type      = string
    default   = "" 
    sensitive = true
}

variable "secret_key" {
    description = "Secret Access Key"
    type      = string
    default   = "" 
    sensitive = true
}

variable "region" {
    type    = string
    default = "" //For Oregon : us-west-2
}

###DynamoDB###
variable "dynamodb-name" {
    description = "name for your table"
    type = string
    default = ""
}

variable "user-id" {
    description = "id of the user"
    type = string
    default = ""
}

variable "primary-key-name" {
    desdescription = "name of the primary key"
    type = string
    default = ""
}

variable "secondary-key-name" {
    description = "name of the secondary key"
    type = string
    default = ""
}

variable "primary-key-type" {
    description = "type of the primary key"
    type = string
    default = "" // S for String, N for number, B for binary
}

variable "secondary-key-type" {
    description = "type of the secondary key"
    type = string
    default = "" // S for String, N for number, B for binary
}

variable "read-capacity" {
    description = "number of read units for the table"
    type = number
    default = ""
}

variable "write-capacity" {
    description = "number of write units for the table"
    type = number
    default = ""
}

variable "billing-mode" {
    description = "Controls how you are charged for read and write throughput and how you manage capacity"
    type = string
    default = "" // PROVISIONED or PAY_PER_REQUEST
}

variable "kms-key-arn" {
    description = "kms key arn for the server side encryption"
    type = string
    default = ""
}

variable "ttl-enabled" {
    description = "time to live"
    type = bool
    default = false // true : enabled, false : disabled
}


###Tags###
variable "author" {
    description = "name of the author"
    type    = string
    default = ""
}

variable "project-name" {
    description = "name of the project"
    type    = string
    default = ""
}