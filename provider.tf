terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # backend "s3" {} -> Ativaremos quando o bucket for criado
}

provider "aws" {
  region = var.aws_region
}