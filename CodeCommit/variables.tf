###################################################
# Author: bfayty Date: 26/04/2022
# Version : 1.0
#
# Description:
# Variables for repository and Providers
#
# Variables list :
# VARIABLE NAME                    : DESCRIPTION                                | TYPE
#----------------------------------:--------------------------------------------|-------
# access_key (Providers)           : Access Key ID                              | String
# secret_key (Providers)           : Secret Key ID                              | String
# region (Providers)               : Name of the region. By default "us-west-2" | String
# repository-name (Repository)     : Name for the repository                    | String
# default-branch-name (Repository) : Name for the default branch                | String
# author (Tags)                    : Name of the author                         | String
# project-name (Tags)              : Name of the project                        | String
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

###Repository###
variable "repository-name" {
    description = "Name for the repository"
    type    = string
    default = "" 
}


variable "default-branch-name" {
    description = "Name of the default branch"
    type    = string
    default = "" 
}

###Tags###
variable "author" {
    description = "Author"
    type    = string
    default = "" 
}

variable "project-name" {
    description = "Name of the project"
    type    = string
    default = "" 
}