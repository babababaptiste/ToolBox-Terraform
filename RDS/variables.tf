###################################################
# Author: bfayty Date: 26/04/2022
# Version 1.0
#
# Description:
# Variables for DBInstance, DBSubnet, Parameter group and Providers
#
# Variables list :
# VARIABLE NAME                        : DESCRIPTION                                                                  | TYPE
#--------------------------------------:------------------------------------------------------------------------------|-------
# access_key (Providers)               : Access Key ID                                                                | String
# private_key (Providers)              : Private Key ID                                                               | String
# region (Providers)                   : Name of your region. By default "us-west-2"                                  | String
# db-instance-name (DB Instance)       : Name for your instance                                                       | String
# allocated-storage (DB Instance)      : Allocated storage for the instance                                           | number
# engine (DB Instance)                 : Engine used for the data base                                                | String
# engine-version (DB Instance)         : Version of the engine                                                        | String
# instance-class (DB Instance)         : Type of instance to use                                                      | String
# username (DB Instance)               : Username for the user of RDS                                                 | String
# password (DB Instance)               : Password for the user of RDS                                                 | String
# skip-final-shot (DB Instance)        : To enable a snapshot before closing, set on false                            | bool
# db-subnet-name (DB Subnet)           : Subnet name                                                                  | String
# subnet-id1 (DB Subnet)               : Id of the existing subnet                                                    | String
# subnet-id2 (DB Subnet)               : Id of the existing subnet in a different AZ                                  | String
# db-pg-name (DB Parameter Group)      : Name of the parameter group                                                  | String
# parameter-name (DB Parameter Group)  : Name of the parameter                                                        | String
# parameter-value (DB Parameter Group) : Value of the parameter                                                       | String
# engine-family (DB Parameter Group)   : Engin family = engine name + engine version (Ex for mysql 5.7 -> 'mysql5.7') | String
# author (Tags)                        : Name of the author                                                           | String
# project-name (Tags)                  : Name of the project                                                          | String
###################################################

###Providers###
variable "access_key" {
    description = "Access Key ID"
    type      = string
    default   = ""
    sensitive = true
}

variable "secret_key" {
    description = "Secret Key ID"
    type      = string
    default   = ""
    sensitive = true
}

variable "region" {
    description = "Name of your region"
    type    = string
    default = "us-west-2" //For Oregon : us-west-2
}

###DB Instance###
variable "db-instance-name" {
    description = "Instance Name"
    type = string
    default = "" 
}

variable "allocated-storage" {
    description = "Allocated storage for the instance"
    type = number
    default = ""
}

variable "engine" {
    description = "Engine used for the data base"
    type = string
    default = ""  //Valid engine name : aurora / aurora-mysql / aurora-postgresql / mariadb / mysql / oracle-ee / oracle-ee-cdb / oracle-se2 / oracle-se2-cdb / postgres / sqlserver-ee / sqlserver-ex / sqlserver-se / sqlserver-web
}

variable "engine-version" {
    description = "Version of the engine"
    type = string
    default = ""
}

variable "instance-class" {
    description = "Type of instance to use"
    type = string
    default = "" //Follow this link to see all db instance type : https://aws.amazon.com/fr/rds/instance-types/
}

variable "username" {
    description = "Username for the user of RDS"
    type = string
    default = "" 
}

variable "password" {
    description = "Password for the user of RDS"
    type = string
    default = "" 
}

variable "skip-final-shot" {
    description = "To enable a snapshot before closing, set on false"
    type = bool
    default = true  
}

###DB Subnet###
variable "db-subnet-name" {
    description = "Subnet name"
    type = string
    default = ""
}

variable "subnet-id1" {
    description = "Id of the existing subnet"
    type = string
    default = "" 
}

variable "subnet-id2" {
    description = "Id of the existing subnet in a different AZ"
    type = string
    default = "" 
}

###DB Parameter Group###
variable "db-pg-name" {
    description = "Name of the parameter group"
    type = string
    default = "" 
}

variable "parameter-name" {
    description = "Name of the parameter"
    type = string
    default = "" 
}

variable "parameter-value" {
    description = "Value of the parameter"
    type = string
    default = ""  
}

variable "engine-family" {
    description = "Engin family = engine name + engine version (Ex for mysql 5.7 -> 'mysql5.7')"
    type = string
    default = ""  
}

###Tags###
variable "author" {
    description = "Author of the project"
    type    = string
    default = "" 
}

variable "project-name" {
    description = "Name of the project"
    type    = string
    default = ""
}