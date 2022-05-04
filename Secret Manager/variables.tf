###################################################
# Author: bfayty Date: 26/04/2022
# Version : 1.0
#
# Description:
# Variables for Key Pair, Secrets Manager, public/private keys and Providers
#
# Variables list :
# VARIABLE NAME                         : DESCRIPTION                                | TYPE
#---------------------------------------:--------------------------------------------|-------
# access_key (Providers)                : Access Key ID                              | String
# secret_key (Providers)                : Secret Key ID                              | String
# region (Providers)                    : Name of the region. By default "us-west-2" | String
# secretsManagerName (Secrets Manager)  : Name of the secret                         | String
# key-algo (public/private keys)        : Algorithm of the keys                      | String
# keyName (Key Pair)                    : Name of the Key Pait                       | String
###################################################

variable "access_key" {
    description = "Access Key ID"
    type      = string
    default   = "" 
    sensitive = true
}

variable "secret_key" {
    description = "Secret Access Key ID"
    type      = string
    default   = "" 
    sensitive = true
}

variable "region" {
    description = "name of the region" 
    type = string
    default = "us-west-2"
}

variable "secretsManagerName" {
    description = "name of the secret"
    type = string
    default = ""
}

variable "key-algo" {
    description = "algorithm of the keys : RSA"
    default = "RSA"
}

variable "keyName" {
    description = "name of your key pair"
    type = string
    default = ""  
}
