terraform {
  required_version = "~> 1.3" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "mlops-aws-cicd-pipeline"
    key = "terraform.tfstate"
    region = "ap-south-1"
    
  }
}

provider "aws" {

  region  = "ap-south-1"
  profile = "default"

}