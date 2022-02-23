terraform {
  required_providers {
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
  region  = var.Region
  version = "4.2.0"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.4.0"

  name          = "web"
  ami           = "ami-0ad8ecac8af5fc52b"
  instance_type = "t2.micro"
}
