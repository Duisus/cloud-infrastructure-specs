variable "image_url" {
  type = string
}

resource "yandex_serverless_container" "app-container" {
  name   = "virtualization-project-app"
  memory = 256
  image {
    url = var.image_url
  }
}
