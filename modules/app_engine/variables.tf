variable "project_id" {
  description = "The ID of the project in which to create the App Engine application."
  type        = string
}

variable "region" {
  description = "The region where the App Engine application will be created."
  type        = string
  default     = "us-central1"
}

variable "app_source" {
  description = "The path to the application source zip file."
  type        = string
}

variable "db_instance_connection_name" {
  description = "The connection name of the Cloud SQL instance."
  type        = string
}

variable "db_name" {
  description = "The name of the database to connect to."
  type        = string
}

variable "db_user" {
  description = "The database user name."
  type        = string
}

variable "db_password" {
  description = "The password for the database user."
  type        = string
}

