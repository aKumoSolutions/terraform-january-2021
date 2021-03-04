module "s3" {
  source = "github.com/aKumoSolutions/terraform-january-2021//modules/s3?ref=v0.1.1"
  s3_bucket_name = "${terraform.workspace}-workspace-example-bucket"
  versioning_enabled = var.is_versioning_enabled
  principals = var.principals_list
  env = terraform.workspace
}
