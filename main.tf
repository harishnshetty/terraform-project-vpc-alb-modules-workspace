module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.75.0.0/16"
  tags = {
    Name = "vpc-alb"
  }
}
