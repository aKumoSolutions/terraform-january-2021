resource "aws_security_group" "multiple_rules" {
  name = "dynamic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = var.rules
    iterator = rule
    content {
        description = rule.value.description
        from_port   = rule.value.port
        to_port     = rule.value.port
        protocol    = "tcp"
        cidr_blocks = rule.value.cidr
    }
  }
}
