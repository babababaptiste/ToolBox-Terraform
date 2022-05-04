# EC2 Terraform

## About

This code enables you to create a new EC2 instance using existing VPC, Subnet and an AWS AMI.

## Terraform

In this part we will see how to set up and deploy aws EC2 instance on Terraform.

For more informations : [Terraform EC2 Instance documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)

### EC2

1. EC2.tf file

This file creates a new EC2 instance using existing VPC, Subnet and an AWS AMI.
Don't modify this file.

2. variables.tf file 

- Type your access key and secret key in the default variable.

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
- For the Subnet id and the security group id type your existing resources.
- For the EC2 instance type you can see all available type [here](https://aws.amazon.com/fr/ec2/instance-types/)
- For the key pair name if you don't have a key pair do [this](https://us-west-2.console.aws.amazon.com/codesuite/codecommit/repositories/ToolBox-Terraform/browse/refs/heads/main/--/Terraform/Secrets%20Manager?region=us-west-2) first.
- For all the other variables follow the description to fill.

3. Providers.tf

This file setup your aws providers (region, access key and private key) and terraform provider (source and version).
Don't modify this file.

### AMI Configuration

    1. Search for an AMI

- To search for an AMI you can run this command on your AWS CLI :
```
aws ec2 describe-images --owners amazon --region us-west-2 --filters "Name=name,Values=Windows*" --query 'Images[*].[Name]' --output text
```
(Specify your OS type in the 'Name=name,Values=Windows*' part)
Result : 
```
Windows_Server-2016-English-Full-SQL_2019_Express-2022.01.12
Windows_Server-2012-R2_RTM-Chinese_Simplified-64Bit-Base-2022.03.09
Windows_Server-2022-Portuguese_Brazil-Full-Base-2022.03.09
Windows_Server-2012-RTM-Chinese_Simplified-64Bit-Base-2022.01.12
Windows_Server-2019-English-Full-Base-2022.03.09
Windows_Server-2016-English-Full-SQL_2019_Express-2022.01.19
Windows_Server-2012-R2_RTM-Japanese-64Bit-SQL_2016_SP3_Web-2022.02.10
Windows_Server-2012-R2_RTM-English-64Bit-SQL_2016_SP3_Web-2022.03.09
Windows_Server-2016-English-Core-SQL_2016_SP3_Express-2022.01.12
Windows_Server-2016-English-Full-Containers-2022.01.19
Windows_Server-2016-English-Core-SQL_2016_SP3_Web-2022.01.19
Windows_Server-2016-Korean-Full-SQL_2016_SP3_Standard-2022.01.19
Windows_Server-2012-RTM-English-64Bit-SQL_2012_SP4_Express-2022.03.09
Windows_Server-2016-Japanese-Full-SQL_2016_SP2_Express-2022.03.09
-- More --
```
If you want to have a more specific AMI you can replace the 'name' value following the patern of the result.
Example  for the last Window AMI :
Command line :
```
aws ec2 describe-images --owners amazon --region us-west-2 --filters "Name=name,Values=Windows_Server-2019-English-Full-Base-2022.01.12*" --query 'Images[*].[Name]' --output text 
```
This command gives you only one result :
```
Windows_Server-2019-English-Full-Base-2022.01.12
```
Then you can copy this name in the variable.tf file :
```
variable "ami-request" {
    type    = string
    default = "Windows_Server-2019-English-Full-Base-2022.01.12*" 
}
```

    2. Use a specific AMI

To use a specific AMI you have to type your AMI id in the "ami-id" variable (variables.tf file).

#### If you only have the name of your AMI type this command on your AWS CLI to find the Id :
```
aws ec2 describe-images --owners amazon --region us-west-2 --filters "Name=name,Values=AMIname*" --query 'Images[*].[ImageId]' --output text
```
(Replace the --region us-west-2 with your region and --filters "Name=name,Values=AMIname*" with your AMI Name)

## CloudTrail

Use this commands to see CloudTrail Events:

### See CloudTrail info if EC2 instance fail launching

```
aws cloudtrail lookup-events --lookup-attributes AttributeKey=EventName,AttributeValue=RunInstances
```

### Get events using your access key id

```
aws cloudtrail lookup-events --lookup-attributes AttributeKey=AccessKeyId,AttributeValue=<AccessKeyID>
```

### Get events during a time period

```
aws cloudtrail lookup-events --start-time 2022-04-29T17:00:00+02:00 --end-time 2022-04-29T17:30:00+02:00
```

### You can combine all of this to get more precise

```
aws cloudtrail lookup-events --start-time 2022-04-29T17:00:00+02:00 --end-time 2022-04-29T17:30:00+02:00 --lookup-attributes AttributeKey=AccessKeyId,AttributeValue=<AccessKeyID>
```

### For more precision

- Specify the number of results you want:

```
--max-result <integer>
```

- Specify the start and end time to watch events: 

```
--start-time <timestamp> --end-time <timestamp> 
```

- AttributeKey to be more precise (you can only use 1 AttributeKey): 

``` 
--lookup-attributes AttributeKey=<attribute>,AttributeValue=<string> 
``` 

(AttributeKey : AccessKeyId, EventId, EventName, EventSource, ReadOnly, ResourceName, ResourceType, Username)
