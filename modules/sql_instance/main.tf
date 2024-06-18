resource "google_sql_database_instance" "instance" {
  project = var.project_id
  region  = var.region
  name    = var.instance_name

  settings {
    tier      = var.db_tier
    disk_size = var.disk_size
  }

  database_version = "MYSQL_5_7"
  deletion_protection = false
}

resource "google_sql_database" "database" {
  name     = var.db_name
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_user" "user" {
  name     = var.db_user
  instance = google_sql_database_instance.instance.name
  password = var.db_password
}

