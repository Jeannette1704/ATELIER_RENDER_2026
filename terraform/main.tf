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
