# CodeCommit Terraform

## About

This code enables you to create a new CodeCommit repository

## Terraform

In this part we will see how to set up and deploy aws CodeCommit repository on Terraform.

For more informations : [Terraform CodeCommit repository documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codecommit_repository)

### CodeCommit

1. CodeCommit.tf file :

This file creates a new CodeCommit repository.

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

- In the repository-name variable type the name you want for you repository.

- In the default-branch-name variable type the name you want for you default branch.

- In the region variable type the name of your region.

- Fill the tags variables with the author name and the project name.

3. Providers.tf file :

This file set up your aws providers (region, access key and private key) and terraform provider (source and version).

Don't modify this file.

4. AWS CLI useful commands for CodeCommit :

- Add File :
```
aws codecommit put-file --repository-name testRepositoryBF, --branch-name bracntestbf, --file-content C:\Users\bfayty\Desktop\terraform\code\EC2\ec2.tf, --file-path code/ec2.tf
```

Use your own repository-name, branche-name, file-content and file-path.

- Retrieve Commit Id :
```
aws codecommit get-branch --repository-name testRepositoryBF --branch-name bracntestbf
```

Use your own repository-name and branch-name.

- Get Info And Content of A File :
```
aws codecommit get-file --repository-name testRepositoryBF --commit-specifier ee7cec4d2d4f6a24a70890c5604121b5e6605e5a --file-path readme.md
```

Use your own repository-name, commit-specifier (commit id) and file-path.

- Create Commit :
```
aws codecommit create-commit --repository-name testRepositoryBF --branch-name bracntestbf --put-files "filePath=code/test.tf,fileContent=" --parent-commit-id bd1ce462a94d62ec778c3e6dc94e50599a01499d
```

Use your own repositoy-name, branch-name and parent-commit-id.

For the filePath specify the name of your file (folder/file) and the content of your file in fileContent.