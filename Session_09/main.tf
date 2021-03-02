module "s3" {
  source = "github.com/aKumoSolutions/terraform-january-2021//modules/s3"
  s3_bucket_name = var.s3_name
  versioning_enabled = var.is_versioning_enabled
  principals = var.principals_list
}