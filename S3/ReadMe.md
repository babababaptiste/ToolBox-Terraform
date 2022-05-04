# S3 Bucket Terraform

## About

This code enables you to create a new S3 Bucket and generate a KMS key or use an existing one.

## Terraform

In this part we will see how to set up and deploy aws S3 Bucket on Terraform.

For more informations : [Terraform S3 Bucket documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)

### S3

1. S3.tf file

This file creates a new S3 Bucket and generate a KMS key or use an existing one.

To set up your KMS Key you have 2 options :

- use an existing KMS key :

    - In the S3.tf file :
    
    Line 33 to 47 :
    
    Put all this part under comment (Add ```/*``` at the begining of line 33 and ```*/``` at the end of line 47)

    - In the variables.tf file :
    
    Type your Key id in the default section :
    
    ```
    variable "kms_master_key_id" {
        type        = string
        default     = ""
    }
    ```

- generate an KMS key :
- 
    - In the S3.tf file :
    - 
    Line 18 to 27 :

    Put all this part under comment (Add ```/*``` at the begining of line 18 and ```*/``` at the end of line 27)

    - In the variables.tf file :
    
    Leave empty the "kms_master_key_id" default section.

2. variables.tf file

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

- In the bucket-name variable type the name you want for you S3 Bucket.

- For all the other variables follow the description to fill.

3. Providers.tf

This file setup your aws providers (region, access key and private key) and terraform provider (source and version).
Don't modify this file.