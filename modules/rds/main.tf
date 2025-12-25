# DB subnets group

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db_subnet_group"
  subnet_ids = [for subnet in aws_subnet.db_subnet_private : subnet.id]
  tags = {
    Name        = "db_subnet_group_${terraform.workspace}"
    Environment = "${terraform.workspace}"
    Project     = "vpc-alb"
    Tier        = "backend"
  }
}

# RDS SQL DB instance

resource "aws_db_instance" "db_instance" {
  identifier     = "db_instance"
  instance_class = "db.t2.micro"
  engine         = "mysql"
  engine_version = "8.0"

  parameter_group_name = "default.mysql8.0"

  storage_encrypted = false
  allocated_storage = 20
  storage_type      = "gp3"

  username = "admin"
  password = "password"

  vpc_security_group_ids = [aws_security_group.backend_alb_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name

  multi_az            = false
  publicly_accessible = false

  backup_retention_period = 7
  backup_window           = "03:00-05:00"
  maintenance_window      = "sun:05:00-sun:06:00"

  skip_final_snapshot          = true
  deletion_protection          = false
  apply_immediately            = true
  performance_insights_enabled = true

  tags = {
    Name        = "db_instance_${terraform.workspace}"
    Environment = "${terraform.workspace}"
    Project     = "vpc-alb"
    Tier        = "DB"
  }
}
