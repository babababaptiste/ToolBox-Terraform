# Secrets Manager Terraform

## About

This code enables you to create Key Pair for your EC2 and store them in secrets manager.

## Terraform

In this part we will see how to set up and deploy aws Secrets Manager by creating key, storing them in a secret and use them as key pair. 

For more informations : 

- [Terraform Secrets Manager documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret)

- [Terraform Key Pair documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair)

- [Terraform tls key documentation](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key)

### Secrets Manager

1. SecretsManager.tf file :

This file creates a new Secrets manager, a new key pair by generating tls keys and storing them in the secret.

Don't modify this file.

2. variables.tf file :

Type your access key and secret key in the default variable section.

```
variable "access_key" {
    type      = string
    default   = "*********" //Access Key ID
    sensitive = true
}

variable "secret_key" {
    type      = string
    default   = "***********************" //Secret Access Key
    sensitive = true
}
```

- In the repository-name variable type the name you want for your repository.

- For the secretsManagerName variable type the name your want for your secret. ! You have to choose a unique name !

- For the key-algo variable the default value is "RSA" but it can also support "ED25519"

- For keyName variable type the name you want for your key pair.

3. Providers.tf file :

This file set up your aws providers (region, access key and private key), tls provider and terraform provider (source and version).

Don't modify this file.