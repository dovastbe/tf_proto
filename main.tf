terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.0"
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
  count = var.vms ? 1 : 0
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.4.0"

  name          = "web"
  ami           = "ami-0ad8ecac8af5fc52b"
  instance_type = "t2.micro"
}
