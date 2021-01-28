resource "aws_instance" "first_ec2" {
  ami           = data.aws_ami.amznlinux2.image_id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.webserver_sg.id, "sg-2624e60b"]
  user_data = data.template_file.user_data.rendered
  tags = {
    Name        = "first-${var.env}"
    Name2       = format("first-%s", var.env)
    Environment = var.env
  }
}

data "aws_ami" "amznlinux2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-2.0*"]
  }

  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}

data "template_file" "user_data" {
  template = file("user_data.sh")
  vars = {
    env = var.env
  }
}

resource "aws_security_group" "webserver_sg" {
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
  security_group_id = aws_security_group.webserver_sg.id
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.webserver_sg.id
}