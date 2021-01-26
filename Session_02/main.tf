resource "aws_instance" "first_ec2" {
  ami           = "ami-0be2609ba883822ec"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.first_sg.id, "sg-2624e60b"]
  user_data = <<EOF
#!/bin/bash
yum install httpd -y
echo "Hello from EC2" >> /var/www/html/index.html
systemctl start httpd
  EOF
  tags = {
    Name        = "first"
    Environment = var.env
  }
}
resource "aws_security_group" "first_sg" {
  name        = "allow_http"
  description = "Allow http inbound traffic"

  tags = {
    Name = "allow_http"
  }
}

resource "aws_security_group_rule" "http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.first_sg.id
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.first_sg.id
}