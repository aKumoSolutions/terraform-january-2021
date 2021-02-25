env = "dev"
skip_snapshot = true
storage = 10
instance_class = "db.t2.micro"
username = "dev_user"

bucket         = "terraform-january-state"
key            = "dev/rds.tfstate"
region         = "us-east-1"
dynamodb_table = "terraform-state-locks"
