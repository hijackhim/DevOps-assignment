provider "google" {
  project = var.project_id
  region  = var.region
}

module "sql_instance" {
  source     = "./modules/sql_instance"
  project_id = var.project_id
  instance_name  = "my-cloud-sql-instance"
  region     = var.region
  db_name    = var.db_name
  db_user    = var.db_user
  db_password = var.db_password
}

module "app_engine" {
  source     = "./modules/app_engine"
  project_id = var.project_id
  region     = var.region
  app_source = var.app_source
  db_instance_connection_name = module.sql_instance.connection_name
  db_name = var.db_name
  db_user = var.db_user
  db_password = var.db_password
}

