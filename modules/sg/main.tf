resource "aws_security_group" "alb_sg" {
  name        = "alb_sg"
  description = "Security Group for ALB"
  vpc_id      = aws_vpc.main.id
}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Security Group for Web"
  vpc_id      = aws_vpc.main.id
}

resource "aws_security_group" "app_sg" {
  name        = "app_sg"
  description = "Security Group for App"
  vpc_id      = aws_vpc.main.id
}

resource "aws_security_group" "db_sg" {
  name        = "db_sg"
  description = "Security Group for DB"
  vpc_id      = aws_vpc.main.id
}
