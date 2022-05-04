# CodeCommit Terraform

## About

This code enables you to create a Network Load Balancer and an AutoScalling Group.

## Terraform

In this part we will see how to set up and deploy AWS Network Load Balancer and AWS AutoScalling Group on Terraform.

For more informations : 
- [Terraform Load Balancer documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb)

- [Terraform AutoScalling documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group)

### Network Load Balancer

1. NLB.tf file :

This file creates 1 Network Load Balancer, 1 LB Listener, 1 LB Target Group, 1 AutoScalling Group, 1 AutoScalling Attachment, 1 Target Group Attachment and 1 Launch Template.

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

- In the region variable type the name of your region.

- Fill the tags variables with the author name and the project name.

- Fill all the other variables following their description.

3. Providers.tf file :

This file set up your aws providers (region, access key and private key) and terraform provider (source and version).

Don't modify this file.