module "rds_module" {
  source = "../../../modules/rds"
  
  env = "qa"
  skip_snapshot = true
  storage = 15
  instance_class = "db.t2.micro"
  username = "qa_user"
}