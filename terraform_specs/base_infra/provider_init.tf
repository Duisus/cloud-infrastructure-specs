terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

variable "init_provider_info" {
  type = object({
    auth_token = string
    cloud_id   = string
    folder_id  = string
  })
}

provider "yandex" {
  token     = var.init_provider_info.auth_token
  cloud_id  = var.init_provider_info.cloud_id
  folder_id = var.init_provider_info.folder_id
  zone      = "ru-central1-a"
}
