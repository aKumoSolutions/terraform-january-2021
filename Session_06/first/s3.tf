resource "aws_s3_bucket" "remote_state" {
  bucket = "example-bucket-tf2021"
}

output "example_bucket" {
  value = aws_s3_bucket.remote_state.id
}