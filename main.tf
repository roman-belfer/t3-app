terraform {
  required_providers {
    aiven = {
      source  = "aiven/aiven"
      version = ">=4.0.0, < 5.0.0"
    }
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.16.0"
    }
  }
}

# Create the Aiven service
resource "aiven_pg" "example_pg" {
  project                 = "example-project"
  cloud_name              = "google-asia-southeast1"
  plan                    = "business-8"
  service_name            = "example-pg"
  termination_protection  = true
}

# Configure the PostgreSQL Provider by referencing the Aiven service resource
provider "postgresql" {
  host            = aiven_pg.example_pg.service_host
  port            = aiven_pg.example_pg.service_port
  database        = aiven_pg.example_pg.pg.dbname
  username        = aiven_pg.example_pg.service_username
  password        = aiven_pg.example_pg.service_password
  sslmode         = "require"
  connect_timeout = 15
}

resource "postgresql_role" "example_role" {
  name     = "example-role"
}