terraform {
  backend "s3" {
    bucket = "terraform-january-state"
    key    = "dev/webserver.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locks"
  }
}