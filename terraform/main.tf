terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.56.0"
    }
  }
}

provider "aws" {
  region                  = "ap-southeast-1"
  shared_credentials_file = "/Users/syabiqah/.aws/credentials"
  profile                 = "icare"
}

### AWS ECR ###
resource "aws_ecr_repository" "name" {
  for_each             = toset(["next_test1", "next_test2"])
  name                 = each.value
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.scan_images_on_push
  }

  tags = {
    project = "test"
    environment = "dev"
  }
}

### VPC ###