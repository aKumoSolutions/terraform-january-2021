resource "aws_sqs_queue" "count_queue" {
  count = length(var.my_list)
  name = "count-queues-${var.my_list[count.index]}"
}