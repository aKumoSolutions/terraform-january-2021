module "rds_module" {
  source = "../../../modules/rds"
  
  env = var.r_env
  skip_snapshot = var.r_skip_snapshot
  storage = var.r_storage
  instance_class = var.r_instance_class
  username = var.r_username
}

output "pet_name" {
  value = module.rds_module.module_pet_name_value
}

output "username" {
  value = module.rds_module.module_username
}

output "address" {
  value = module.rds_module.module_address
}

