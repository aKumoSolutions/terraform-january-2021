module "s3" {
  source = "github.com/aKumoSolutions/terraform-january-2021//modules/s3?ref=v0.1.1"
  s3_bucket_name = var.s3_name
  versioning_enabled = var.is_versioning_enabled
  principals = var.principals_list
  env = var.environment
}

module "s3_region" {
  source = "github.com/aKumoSolutions/terraform-january-2021//modules/s3?ref=v0.1.1"
  s3_bucket_name = "different-region-${var.s3_name}"
  versioning_enabled = var.is_versioning_enabled
  principals = var.principals_list
  env = var.environment
  providers = {
    aws = aws.east2
  }
}