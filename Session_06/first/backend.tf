terraform {
  backend "s3" {
    bucket = "terraform-january-state"
    key    = "sns.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locks"
  }
}