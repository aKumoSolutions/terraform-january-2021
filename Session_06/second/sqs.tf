resource "aws_sqs_queue" "example_queue" {
  name = "example-queue"
}

resource "aws_sns_topic_subscription" "example_subscription" {
  topic_arn = data.terraform_remote_state.sns.outputs.example_topic_arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.example_queue.arn
}