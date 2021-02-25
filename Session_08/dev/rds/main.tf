module "rds_module" {
  source = "../../../modules/rds"
  
  env = "dev"
  skip_snapshot = true
  storage = 10
  instance_class = "db.t2.micro"
  username = "dev_user"
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

