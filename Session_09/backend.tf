terraform {
  backend "s3" {
    bucket = "terraform-january-state"
    key    = "session_09/s3.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locks"
  }
}