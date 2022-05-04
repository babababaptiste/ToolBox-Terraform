###################################################
# Author: bfayty Date: 26/04/2022
# Version : 1.0
#
# Description:
# 1 CodeCommit Repository with 1 branch
# default branch : master
###################################################

resource "aws_codecommit_repository" "testRepository" {
  repository_name = var.repository-name
  default_branch  = var.default-branch-name

  tags = {
      "name"   = var.repository-name
      "author" = var.author
      "projet" = var.project-name
  }
}