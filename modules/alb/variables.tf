variable "vpc_id" {
  type = string
}

variable "alb_subnet_public" {
  type = list(string)
}

variable "alb_sg" {
  type = list(string)
}
