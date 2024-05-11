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

resource "postgresql_role" "example_role" {
  name     = "example-role"
}