provider "aws" {
  region = var.aws_region
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# git commit -m "Updated Variables"

# terraform apply -var="aws_region=us-west-2"

# ps aux | grep terraform

# terraform force-unlock fefcd4f8-b8bf-0f00-4503-4bd36cd0e331

# incase my remote state is already locked run these commands to unlock it