terraform {
  required_version = ">= 0.14, < 0.15"
  required_providers {
    aws = "~> 3.24.0"
  }
}

provider "aws" {
    region = "us-east-1"
}