terraform {
  backend "s3" {
    bucket         = "landmarkdevops-terraform-state-file"
    key            = "prod/landmarkdevops-state-file"
    region         = "us-east-1"
    profile        = "terraform"
    encrypt        = true
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
}

