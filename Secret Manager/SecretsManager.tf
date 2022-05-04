###################################################
# Author: bfayty Date: 29/04/2022
# Version : 1.0
#
# Description:
# 1 secrets manager to store EC2 Key Pair
# Creation of public and private key
# Creation of a Key Pair
###################################################

#Create key 
resource "tls_private_key" "KeyTest" {
  algorithm = var.key-algo
}

# Store locally public and private keys
locals  {
    PrivateKey = tls_private_key.KeyTest.private_key_pem
    PublicKey  = tls_private_key.KeyTest.public_key_pem
}

#Store the private key in a local file
resource "local_sensitive_file" "private_key" {
    content  = local.PrivateKey
    filename = "private_key.pem"
}

#Create a secret 
resource "aws_secretsmanager_secret" "crdtls-key-manager" {
    name = var.secretsManagerName
}

#Provisionne a secret
resource "aws_secretsmanager_secret_version" "crdtlsKeyManagerVersion" {
    secret_id     = aws_secretsmanager_secret.crdtls-key-manager.id
    secret_string =  "${local.PublicKey}, ${local.PrivateKey}"
}

#Create EC2 Key
resource "aws_key_pair" "newKeyPair" {
    key_name   = var.keyName
    public_key = tls_private_key.KeyTest.public_key_openssh
}

# Ouput the public key
output "public-key"{
    value = tls_private_key.KeyTest.public_key_pem
}