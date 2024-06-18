
output "instance_name" {
  description = "The name of the Cloud SQL instance"
   value       = module.sql_instance.instance_name
}

output "app_engine_url" {
  description = "The URL of the App Engine application"
  value       = module.app_engine.app_engine_url
}

