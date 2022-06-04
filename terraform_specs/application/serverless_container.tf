variable "image_url" {
  type = string
}

variable "service_account_id" {
  type = string
}

resource "yandex_serverless_container" "app-container" {
  name               = "virtualization-project-app"
  memory             = 256
  service_account_id = var.service_account_id
  image {
    url = var.image_url
  }
}
