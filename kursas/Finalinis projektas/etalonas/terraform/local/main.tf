# Lokalus stendas per Terraform (28.1 pamoka): tinklas, tomas, PostgreSQL ir API konteineriai.
# terraform init && terraform apply -var 'db_password=...' ; terraform destroy
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

variable "db_password" {
  type      = string
  sensitive = true
}
variable "env" {
  type    = string
  default = "dev"
}
variable "api_port" {
  type    = number
  default = 8090
}
variable "api_image" {
  type    = string
  default = "etalonas-api:local"
}

resource "docker_network" "net" {
  name = "etalonas-${var.env}"
}

resource "docker_volume" "pgdata" {
  name = "etalonas-${var.env}-pgdata"
}

resource "docker_image" "postgres" {
  name = "postgres:16-alpine"
}

resource "docker_container" "db" {
  name    = "etalonas-${var.env}-db"
  image   = docker_image.postgres.image_id
  restart = "unless-stopped"
  env = [
    "POSTGRES_USER=notes",
    "POSTGRES_PASSWORD=${var.db_password}",
    "POSTGRES_DB=notes",
  ]
  networks_advanced {
    name    = docker_network.net.name
    aliases = ["db"]
  }
  volumes {
    volume_name    = docker_volume.pgdata.name
    container_path = "/var/lib/postgresql/data"
  }
}

resource "docker_container" "api" {
  name    = "etalonas-${var.env}-api"
  image   = var.api_image
  restart = "unless-stopped"
  env = [
    "DATABASE_URL=postgresql+psycopg2://notes:${var.db_password}@db:5432/notes",
  ]
  ports {
    internal = 8000
    external = var.api_port
  }
  networks_advanced {
    name = docker_network.net.name
  }
  depends_on = [docker_container.db]
}

output "api_url" {
  value = "http://localhost:${var.api_port}"
}
