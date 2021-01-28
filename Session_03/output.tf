output "ec2_public_ip" {
  value = aws_instance.first_ec2.public_ip
}

output "sg_name" {
  value = aws_security_group.webserver_sg.name
}