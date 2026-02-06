terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = map(string)
  default = {
    dev  = "t2.micro"
    test = "t3.small"
    prod = "t3.medium"
  }
}

variable "instance_count" {
  description = "EC2 instance count"
  type        = map(number)
  default = {
    dev  = 1
    test = 1
    prod = 2
  }
}

output "instance_ips" {
  value = aws_instance.app[*].public_ip
  }
}