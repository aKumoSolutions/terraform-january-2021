resource "aws_sns_topic" "example_topic" {
  name = "example-topic"

  tags = {
    testKey = "key from terraform"
    key2 = "value2"
  }
}

output "example_topic_arn" {
  value = aws_sns_topic.example_topic.arn
}