# RDS Terraform

## About

This code enable you to create a new relational database.

### Terraform 

In this part we will see how to set up and deploy aws relationnal database service

For more informations : [Terraform RDS documentations](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance)

### RDS

1. RDS.tf file

This file creates a new relational database instance, a new data base subnet and a new parameter group.

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

- In the db-instance-name variable type the name you want for your data base instance.

- In the allocated-storage variable type the number of resource you want (in gibibytes).

- In the engine variable type the name of your data base engine (For exemple mysql).

- In the engine-version variable type the version of your data base engine.

- In the instance-class variable type the [type of instance](https://aws.amazon.com/fr/rds/instance-types/) you want for your data base. 

- With the username and password variables type the username and password for the master DB user. 

- When the skip-final-shot is set on false it creates a snapshot before closing 

-  In the db-subnet-name variable type the name you want for your data base subnet.

- In subnet-id1 and subnet-id2 variables type the Id of your existing subnets (You have to set 2 differents subnets).

- For the parameter-name and parameter-value you can specify how your database is configure.

    If you want to add more parameter groups just copy code from line 36 to 39 (RDS.tf) and paste them bellow.

    Then directly fill the name and value on the RDS.tf file.

    Example :
    ```
    parameter {
        name  = "character_set_server"
        value = "utf8"
      }
    ```

- In the engine-family variable type the name of your engine and his version. Example for mysql version 5.7 the engine family is msql5.7

- For all the other variables follow the variable description to fill.


3. Providers.tf

This file setup your aws providers (region, access key and private key) and terraform provider (source and version).

Don't modify this file.