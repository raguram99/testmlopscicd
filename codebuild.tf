resource "aws_codebuild_project" "project" { 
  name          = var.project_name
  description   = var.project_description
  build_timeout = var.build_timeout
  service_role  = aws_iam_role.tf-codebuild-role.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type    = var.build_compute_type
    image           = var.build_image
    type            = var.build_type
    privileged_mode = var.privileged_mode

  }

  logs_config {
    cloudwatch_logs {
      group_name = var.cloudwatch_log_group_name
    }
  }

  source {
    type            = "GITHUB"
    location        = var.source_location
    git_clone_depth = 1
    buildspec = file("buildspec/apply-buildspec.yml")

  }

}

/*
resource "aws_codebuild_webhook" "webhook" {
  project_name = aws_codebuild_project.project.name
  build_type   = "BUILD"
  filter_group {
    filter {
      type    = "EVENT"
      pattern = "PULL_REQUEST_CREATED,PULL_REQUEST_UPDATED"
    }

    filter {
      type    = "BASE_REF"
      pattern = "master"
    }
  }
}


resource "aws_codebuild_webhook" "example" {
  project_name = aws_codebuild_project.project.name
  build_type   = "BUILD"
  filter_group {
    filter {
      type    = "EVENT"
      pattern = "PUSH"
    }

    filter {
      type    = "BASE_REF"
      pattern = "master"
    }
  }
}
*/