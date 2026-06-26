terraform {
  required_providers {
    render = {
      source  = "render-oss/render"
      version = "1.3.3"
    }
  }
}

provider "render" {
  api_key  = var.render_api_key
  owner_id = var.render_owner_id
}

variable "github_actor" {
  type = string
}

variable "render_api_key" {
  type      = string
  sensitive = true
}

variable "render_owner_id" {
  type = string
}

variable "image_url" {
  type = string
}

variable "image_tag" {
  type = string
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
      image_url = var.image_url
      tag       = var.image_tag
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
