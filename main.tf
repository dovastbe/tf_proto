terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "dovastbe"

    workspaces {
      name = "tf_prototype"
    }
  }
}


provider "aws" {
  region = var.Region
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name          = var.vms.host1.name
  ami           = var.vms.host1.ami
  instance_type = "t2.micro"
  tags          = var.vms.host1.tags
}
