resource "aws_db_instance" "rds" {
  allocated_storage         = 10
  storage_type              = "gp2"
  engine                    = "mysql"
  engine_version            = "5.7"
  instance_class            = "db.t2.micro"
  identifier                = "${var.env}-rds"
  name                      = "main"
  username                  = "admin"
  password                  = random_password.passsword.result
  skip_final_snapshot       = var.skip_snapshot
  final_snapshot_identifier = var.skip_snapshot == true ? null : "${var.env}-rds-snapshot"
  vpc_security_group_ids    = [aws_security_group.rds_sg.id]
  apply_immediately         = true
  publicly_accessible       = var.env == "dev" ? true : false
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.env}-rds-sg"
  description = "allow from self and local laptop"

  tags = {
    Name = "${var.env}-rds-sg"
  }
}

resource "aws_security_group_rule" "self" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  self              = true
  security_group_id = aws_security_group.rds_sg.id
}

resource "aws_security_group_rule" "local_laptop" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "TCP"
  cidr_blocks       = ["173.169.153.13/32"]
  security_group_id = aws_security_group.rds_sg.id
}
