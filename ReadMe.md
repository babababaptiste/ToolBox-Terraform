# ToolBox-Terraform

## About

This is a Toolbox to create aws structures.

You will find specific informations to set up and launch your structure on each folder.

## Clone the repository

- Install [git](https://git-scm.com/downloads) on your computer.

- To clone the repository run this command on your terminal :
```
git clone https://git-codecommit.us-west-2.amazonaws.com/v1/repos/ToolBox-Terraform
```
To find the git link click on 'Clone URL' and then 'Clone HTTPS' or 'Clone SSH'

- If you already clone the repository run this command where your folder is located to get the latest version of the code :
```
git pull
```

## Configure your AWS CLI

- Run this command on your terminal to configure your AWS CLI :
```
aws configure
```

Then enter the corresponding informations 

```
AWS Access Key ID [None]: 
AWS Secret Access Key [None]: 
Default region name [None]: 
Default output format [None]: 
```

## Terraform

In this part we will see how to set up and deploy aws structures using Terraform.

### Configure your Terraform CLI

- Dowload [Terraform CLI](https://www.terraform.io/downloads) and install it.

1. To verify if the installation is complete type this command on your terminal :
```
terraform version
```
If terraform is install it will return you the version you installed.

### Deployement using Terraform

1. First initiate your folder where your code is located:
```
terraform init
```
result :
```
Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v4.9.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

2. Then run this command to apply your code :
```
terraform apply
```
It will return you the plan of your structure.

- type 'yes' to deploy your structure

4. Main terraform commands :
```
init          Prepare your working directory for other commands
validate      Check whether the configuration is valid
plan          Show changes required by the current configuration
apply         Create or update infrastructure
destroy       Destroy previously-created infrastructure
```