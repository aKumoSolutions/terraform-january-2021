resource "aws_sqs_queue" "terraform_queue" {
  for_each = {
    first = "first"
    second = "second"
  }
  name = "${each.value}-terraform-functions-queue"
  tags = local.tags
}

output "test" {
  value = aws_sqs_queue.terraform_queue["first"].arn
}

#env = dev01-us

variable "env" {
  
}

locals {
  env_to_owner = {
    "dev" = "devowner@test.com"
    "stg" = "stgpwner@test.com"
    "prd" = "prdowner@test.com"
  }
  
  env_short = substr(var.env, 0, 3)


  tags = {
    environment = var.env
    environment_type = local.env_short
    environment_version = regex("[0-9]+", var.env)
    owner = lookup(local.env_to_owner, local.env_short, "devowner@test.com")
  }
}