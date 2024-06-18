output "app_engine_url" {
  description = "URL of the deployed App Engine application"
  value = format("https://${google_app_engine_standard_app_version.app.service}.appspot.com")
}

