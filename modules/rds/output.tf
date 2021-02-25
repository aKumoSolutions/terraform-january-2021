output "module_address" {
  value = aws_db_instance.rds.address
}

output "module_username" {
  value = aws_db_instance.rds.username
}

output "password" {
  value     = aws_db_instance.rds.password
  sensitive = true
}