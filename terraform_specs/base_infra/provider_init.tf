terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

variable "provider_init_info" {
  type = object({
    auth_token = string
    cloud_id   = string
    folder_id  = string
  })
}

provider "yandex" {
  token     = var.provider_init_info.auth_token
  cloud_id  = var.provider_init_info.cloud_id
  folder_id = var.provider_init_info.folder_id
  zone      = "ru-central1-a"
}
