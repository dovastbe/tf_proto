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
  source   = "terraform-aws-modules/ec2-instance/aws"
  version  = "3.4.0"
  for_each = var.ec2_instances

  name          = each.value.name
  ami           = each.value.image_id
  instance_type = "t2.micro"
}

module "db" {
  source   = "terraform-aws-modules/rds/aws"
  for_each = var.rds

  identifier           = each.value.identifier
  engine               = each.value.engine
  major_engine_version = each.value.major_engine_version
  family               = each.value.family
  instance_class       = "db.t2.micro"
  allocated_storage    = each.value.allocated_storage
}
