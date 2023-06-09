#dev
module "dev_app" {
  source = "./my_app_infra_module"
  my_env = "dev"
  instance_type = "t2.micro"
  ami = "ami-007855ac798b5175e"
}

#prd
module "prd_app" {
  source = "./my_app_infra_module"
  my_env = "prd"
  instance_type = "t2.medium"
  ami = "ami-007855ac798b5175e"
}

#stg
module "stg _app" {
  source = "./my_app_infra_module"
  my_env = "stg"
  instance_type = "t2.small"
  ami = "ami-007855ac798b5175e"
}