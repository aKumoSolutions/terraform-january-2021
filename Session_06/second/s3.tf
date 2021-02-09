resource "aws_s3_bucket_object" "object" {
  bucket = data.terraform_remote_state.sns.outputs.example_bucket
  key    = "object.txt"
  source = "file.txt"
}