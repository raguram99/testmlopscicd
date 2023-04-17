resource "aws_codepipeline" "codepipeline" { 
  name     = var.name
  role_arn = aws_iam_role.tf-codepipeline-role.arn

  artifact_store {
    location = var.artifact_bucket_name
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["SourceArtifact"]
      namespace        = "SourceVariables"

      configuration = {
        ConnectionArn    = var.codestar_connection_arn
        FullRepositoryId = var.repository_name
        BranchName       = var.source_branch_name
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
      namespace        = "BuildVariables"
      configuration = {
        ProjectName          = "aws_codebuild_project.project.name"
      }
    }
  }

}
