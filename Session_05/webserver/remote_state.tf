data "terraform_remote_state" "rds" {
  backend = "s3"
  config = {
    bucket = "terraform-january-state"
    key    = "${var.env}/rds.tfstate"
    region = "us-east-1"
  }
}