resource "aws_sqs_queue" "terraform_queue" {
  name = "${terraform.workspace}-terraform-example-queue"
}



resource "random_pet" "test" {
  count = terraform.workspace == "dev" ? 1 : 0
}