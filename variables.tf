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
variable "instance_name" {
  type    = string
}
variable "app_source" {
  type    = string
  default = "hello-world.zip"
}
