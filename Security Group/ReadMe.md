# Secrets Manager Terraform

## About

This code enables you to create a new Security Group.

## Terraform

In this part we will see how to set up and deploy aws Security Group.

For more informations : 

- [Terraform Security Group documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)

### Security Group

1. SecurityGroup.tf file :

This file creates a new Security Group.

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

- For the vpc-id variable, type your existing vpc id.

- For Ingress-protocol and Egress-protocol type the protocol you want. (Valid values: tcp, udp, icmp, icmpv6. Use -1 to to specify all protocols).

- For OSname type the name of your OS (Windows or Linux).

- For all the other variables follow the description to fill.

3. Providers.tf file :

This file set up your aws providers (region, access key and private key), tls provider and terraform provider (source and version).

Don't modify this file.