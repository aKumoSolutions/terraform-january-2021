output "address" {
  value = aws_db_instance.rds.address
}

output "username" {
  value = aws_db_instance.rds.username
}

output "password" {
  value     = aws_db_instance.rds.password
  sensitive = true
}

output "example" {
  value = "example value"
}