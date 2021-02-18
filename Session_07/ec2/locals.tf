locals {
  tags = {
    Name        = "${var.environment}-provisioners"
    Environment = var.environment
  }
  test_local = "test_value"
}