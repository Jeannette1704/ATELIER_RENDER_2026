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
