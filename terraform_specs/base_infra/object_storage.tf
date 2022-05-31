variable "bucket_name" {
  type = string
}

resource "yandex_storage_bucket" "app_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"
}
