resource "aws_sqs_queue" "terraform_queue" {
  for_each = {
    first = "first"
    "third" = "third"
    second = "second"
  }
  name = "${each.value}-terraform-functions-queue"
}

resource "aws_instance" "multiple" {
  for_each =  {
      micro = "t2.micro"
      small = "t2.small"
  }
  instance_type = each.value
  ami = "ami-0be2609ba883822ec"
  tags = {
    "Name" = each.key
  }
}

output "micro" {
  value = aws_instance.multiple["micro"].public_ip
}

provider "aws" {
  region = "us-east-1"
}