# DynamoDB Terraform

## About

This code enables you to create a new DynamoDB table.

## Terraform

In this part we will see how to set up and deploy aws DynamoDB table on Terraform.

For more informations : [Terraform DynamoDB table documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table)

### DynamoDB

1. DynamoDB.tf file :

This file creates a new DynamoDB table.

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

- For the primary-key-name and secondary-key-name variables define a name for your keys.

- For the primary-key-type and primary-key-type variables define the type of your key (S for String, N for number, B for binary).

- For the read-capacity and write-capacity choose the number of units you want to perform each action.

- With the billing-mode variable you can control how you are charged for read and write throughput and how you manage capacity. (PROVISIONED or PAY_PER_REQUEST).

- For the kms-key-arn variable type the key arn for the server side encryption.

- The ttl-enabled variable let you choose if you want to define a time to live for you table. (true to enabled, false to disabled).

- In the region variable type the name of your region.

- Fill the tags variables with the author name and the project name.

3. Providers.tf file :

This file set up your aws providers (region, access key and private key) and terraform provider (source and version).

Don't modify this file.
