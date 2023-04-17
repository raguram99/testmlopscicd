variable "project_name" { 
  type        = string
  description = "Project name"
  default = "mlops-project-dlx"
}

variable "project_description" {
  type        = string
  default     = "mlops-terraform"
  description = "Project description"
}

/*
variable "service_role_arn" {
  type        = string
  description = "Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that enables AWS CodeBuild to interact with dependent AWS services on behalf of the AWS account."
  default = aws_iam_role.tf-codebuild-role.arn
}
*/

variable "build_timeout" {
  type        = number
  default     = 60
  description = "Number of minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait until timing out any related build that does not get marked as completed."
}

variable "privileged_mode" {
  type        = bool
  default     = false
  description = "Whether to enable running the Docker daemon inside a Docker container."
}

variable "build_compute_type" {
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
  description = "Information about the compute resources the build project will use."
}

variable "build_image" {
  type        = string
  default     = "hashicorp/terraform:1.3.0"
  description = "Docker image to use for this build project."
}

variable "build_type" {
  type        = string
  default     = "LINUX_CONTAINER"
  description = "Type of build environment to use"
}

/*
variable "environment_variables_build" {
  type = list(object(
    {
      name  = string
      value = string
      type  = string
    }
  ))

  default = []

  description = "A list of maps that contain the keys 'name', 'value', and 'type'. Valid types are 'PLAINTEXT', 'PARAMETER_STORE', or 'SECRETS_MANAGER'"
}
*/

variable "cloudwatch_log_group_name" {
  type        = string
  description = "Group name of the logs in CloudWatch Logs"
  default = "mlops-log"
}

variable "source_location" {
  type        = string
  description = "Location of the source code from git. Example: https://SomeUser@bitbucket.org/deluxe-development/some_repo.git"
  default = "https://github.com/raguram99/testmlopscicd.git"
 }

 // ---------------------------------------------------------------------------------------------------- //


variable "name" { 
  type        = string
  description = "The name of the pipeline."
  default = "mlops-cide-pipeline"
}

/*
variable "service_role_arn" {
  type        = string
  description = "A service role Amazon Resource Name (ARN) that grants AWS CodePipeline permission to make calls to AWS services on your behalf."
  default = aws_iam_role.tf-codepipeline-role.arn
}
*/

variable "artifact_bucket_name" {
  type        = string
  description = "The location where AWS CodePipeline stores artifacts for a pipeline"
  default = "pipeline-artifacts-mlops"
}

variable "source_branch_name" {
  type        = string
  default     = "main"
  description = "The name of the branch where source changes are to be detected."
}

variable "codestar_connection_arn" {
  type        = string
  description = "The CodeStar connection ARN that is configured and authenticated for Bitbucket integration."
  default = "arn:aws:codestar-connections:ap-south-1:355959503504:connection/9766b0e5-b73a-4ffc-85be-637d9611d873"
}

variable "repository_name" {
  type        = string
  description = "Bitbucket repo in the format of 'account/repository-name'. Example: deluxe-development/d3_deployment_infra"
  default = "raguram99/testmlopscicd"
}

variable "codebuild_project_name" {
  type        = string
  description = "Name of the CodeBuild project that will be used for the Build phase"
  default = "BUILD-project"
}
/*
variable "environment_variables" {
  type = list(object(
    {
      name  = string
      
      value = string
      type  = string
    }
  ))

  default = []

  description = "A list of maps that contain the keys 'name', 'value', and 'type'. Valid types are 'PLAINTEXT', 'PARAMETER_STORE', or 'SECRETS_MANAGER'"
}
*/

