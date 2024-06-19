
terraform {
  backend "gcs" {
    bucket = "your-bucket-nam"
    prefix = "terraform/state/prod"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "sql_instance_1" {
  source       = "../../modules/sql_instance"
  project_id   = var.project_id
  region       = var.region
  db_name      = "${var.db_name}_1"
  db_user      = var.db_user
  db_password  = var.db_password
  instance_name = "prod-instance-1"
  db_tier      = "db-custom-4-16384"
  disk_size    = 20
}

module "sql_instance_2" {
  source       = "../../modules/sql_instance"
  project_id   = var.project_id
  region       = var.region
  db_name      = "${var.db_name}_2"
  db_user      = var.db_user
  db_password  = var.db_password
  instance_name = "prod-instance-2"
  db_tier      = "db-custom-4-16384"
  disk_size    = 20
}

module "app_engine" {
  source         = "../../modules/app_engine"
  project_id     = var.project_id
  region         = var.region
  db_instance_connection_name = module.sql_instance_1.connection_name
  db_name        = var.db_name
  db_user        = var.db_user
  db_password    = var.db_password
  app_source     = "https://storage.googleapis.com/your-bucket-name/hello-world.zip"
}

variable "project_id" {
  description = "The ID of the project in which to create the resources."
  type        = string
}

variable "region" {
  description = "The region where the resources will be created."
  type        = string
  default     = "us-central1"
}

variable "db_name" {
  description = "The name of the database to create."
  type        = string
}

variable "db_user" {
  description = "The name of the database user."
  type        = string
}

variable "db_password" {
  description = "The password for the database user."
  type        = string
}


variable "app_source" {
  description = "The source code for the App Engine application."
  type        = string
  default     = "hello-world.zip"
}

variable "db_tier" {
  description = "The tier of the SQL instance."
  type        = string
  default     = "db-f1-micro"
}

variable "disk_size" {
  description = "The disk size of the SQL instance."
  type        = number
  default     = 10
}

output "app_engine_url" {
  description = "The URL of the App Engine application"
  value       = module.app_engine.app_engine_url
}

output "instance_name_1" {
  description = "The name of the Cloud SQL instance"
   value       = module.sql_instance_1.instance_name
}
output "instance_name_2" {
  description = "The name of the Cloud SQL instance"
   value       = module.sql_instance_2.instance_name
}
