terraform {
  backend "s3" {
    bucket         = "jpillai-state-bucket" # REPLACE WITH YOUR BUCKET NAME
    key            = "./terraform.tfstate"
    region         = "ap-south-1"
    use_lockfile   = true
    encrypt        = true
  }

    # backend "local" {
    #   path = "./terraform.tfstate"
    # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# module "backend" {
#   source = "./Backend"
# }

module "networking" {
  source = "./Networking"
}


module "instance" {
  source = "./Instance"
  subnet_id = module.networking.subnet_id
  security_groups = module.networking.security_groups
}




