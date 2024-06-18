resource "google_app_engine_application" "app" {
  project     = var.project_id
  location_id = var.region
}

resource "google_app_engine_standard_app_version" "app" {
  project     = var.project_id
  service     = "default"
  version_id  = "v1"
  runtime     = "nodejs14"
  entrypoint {
    shell = "node app.js"
  }

  deployment {
    zip {
      source_url = var.app_source
    }
  }

  env_variables = {
    DB_CONNECTION = var.db_instance_connection_name
    DB_NAME       = var.db_name
    DB_USER       = var.db_user
    DB_PASSWORD   = var.db_password
  }
}

