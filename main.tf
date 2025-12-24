module "vpc" {
  source             = "./modules/vpc"
  cidr_block         = "10.75.0.0/16"
  alb_subnet_public  = ["10.75.1.0/24", "10.75.2.0/24", "10.75.3.0/24"]
  web_subnet_private = ["10.75.4.0/24", "10.75.5.0/24", "10.75.6.0/24"]
  app_subnet_private = ["10.75.7.0/24", "10.75.8.0/24", "10.75.9.0/24"]
  db_subnet_private  = ["10.75.10.0/24", "10.75.11.0/24", "10.75.12.0/24"]

  tags = {
    Name = "vpc-alb"
  }
}

