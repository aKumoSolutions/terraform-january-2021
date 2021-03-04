terraform {
  backend "s3" {
    bucket = "terraform-january-state"
    key    = "s3.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locks"
    workspace_key_prefix = "session10"
  }
}