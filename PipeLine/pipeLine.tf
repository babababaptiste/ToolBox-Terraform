resource "aws_codepipeline" "testCodepipelineBF" {
  name     = var.pipeLine-name
  role_arn = var.role-arn

  artifact_store {
    location = aws_s3_bucket.test-bucket-bf.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "S3Bucket"
      version          = "1"
      output_artifacts = ["source_output"]
      run_order        =  1
      region           = var.region

      configuration = {
        BucketName       = aws_s3_bucket.test-bucket-bf.bucket
        //FullRepositoryId     = aws_codecommit_repository.testRepositoryBFayty.repository_id
        //BranchName           = var.branchName
        //ConnectionArn = "test"
        //PollForSourceChanges = false
        //BucketName = var.bucket-name
        //extract = true
      }
    }
  }

  stage {
    name = "Plan"

    action {
      name             = "Plan"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source_output"]
      output_artifacts = ["plan_output"]
      run_order        =  2
      region           = var.region

      configuration = {
        ProjectName = "Test"
      }
    }
  }

  stage {
    name = "Approval"


    action {
      name      = "Approval"
      category  = "Approval"
      owner     = "AWS"
      provider  = "Manual"
      version   = "1"
      run_order =  3
      region    = var.region

      configuration = {
        NotificationArn = "Test"
      }
    }
  }

  stage {
    name = "Apply"

    action {
      name             = "Apply"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["plan_output"]
      output_artifacts = ["apply_output"]
      version          = "1"
      run_order        =  4
      region           = var.region

      configuration = {
        ProjectName = "test"
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "S3"
      input_artifacts = ["apply_output"]
      version         = "1"
      run_order       =  5
      region          = var.region
/*
      configuration = {
        BucketName       = aws_s3_bucket.test-bucket-bf.bucket
        FullRepositoryId = aws_codecommit_repository.testRepositoryBFayty.repository_id
        BranchName       = var.branchName
        Extract          = true
      }*/
    }
  }
}

resource "aws_codecommit_repository" "testRepositoryBFayty" {
  repository_name = var.repository-name
  default_branch = "default"

  tags = {
      "name"   = var.repository-name
      "author" = var.author
      "projet" = var.project-name
  }
}

resource "aws_s3_bucket" "test-bucket-bf" {
    bucket = var.bucket-name

    tags = {
        "name"    = var.bucket-name
        "author"  = var.author
        "project" = var.project-name
    }
}

resource "aws_s3_bucket_acl" "new-bucket-acl" {
  bucket = aws_s3_bucket.test-bucket-bf.bucket
  acl    = "private"
}

