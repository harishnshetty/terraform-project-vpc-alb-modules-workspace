terraform {
  backend "s3" {
    bucket  = "my-tf-demo-harish-bucket-2025"
    key     = "vpc-alb/${terraform.workspace}/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true

  }
}

