resource "aws_instance" "provisioner_ec2" {
  ami           = "ami-0be2609ba883822ec"
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.provisioner_sg.id]
  tags = local.tags
  key_name = "almac"

  provisioner "file" {
    source      = "index.html"
    destination = "/tmp/index.html"

    connection {
      type     = "ssh"
      user     = "ec2-user"
      host     = self.public_ip
      private_key = file("/Users/aisuluuomokoeva/.ssh/id_rsa")
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo mv /tmp/index.html /var/www/html/index.html",
      "sudo systemctl start httpd"
    ]

    connection {
      type     = "ssh"
      user     = "ec2-user"
      host     = self.public_ip
      private_key = file("/Users/aisuluuomokoeva/.ssh/id_rsa")
    }
  }
  
}





resource "aws_security_group" "provisioner_sg" {
  name        = "allow_http"
  description = "Allow http inbound traffic-${local.test_local}"

  tags = local.tags
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["173.169.153.13/32"]
  security_group_id = aws_security_group.provisioner_sg.id
}

resource "aws_security_group_rule" "http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.provisioner_sg.id
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.provisioner_sg.id
}