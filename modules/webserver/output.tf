

output "module_alb_dns" {
  value = aws_lb.webserver_alb.dns_name
}