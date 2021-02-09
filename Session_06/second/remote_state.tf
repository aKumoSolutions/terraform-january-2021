data "terraform_remote_state" "sns" {
  backend = "s3"
  config = {
    bucket = "terraform-january-state"
    key    = "sns.tfstate"
    region = "us-east-1"
  }
}