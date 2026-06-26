terraform {
  required_providers {
    render = {
      source  = "render-oss/render"
      version = "1.3.3"
    }
  }
}

provider "render" {}

variable "github_actor" {
  type        = string
  description = "Le nom d'utilisateur GitHub pour rendre le service unique"
}

resource "render_web_service" "flask_app" {
  name   = "flask-render-iac-${var.github_actor}"
  plan   = "free"
  region = "frankfurt"

  env_vars = {
    ENV = {
      value = "production"
    }
  }

  runtime_source = {
    image = {
      image_url = "dummy_value_replaced_by_github_actions"
    }
  }
}

resource "render_web_service" "adminer" {
  name   = "adminer-${var.github_actor}"
  plan   = "free"
  region = "frankfurt"

  runtime_source = {
    image = {
      image_url = "adminer:latest"
    }
  }
}
