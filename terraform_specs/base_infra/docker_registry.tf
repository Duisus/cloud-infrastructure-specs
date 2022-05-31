resource "yandex_container_registry" "registry" {
  name = "app-docker-registry"
}

resource "yandex_container_repository" "repository" {
  name = "${yandex_container_registry.registry.id}/app-repository"
}

resource "yandex_container_repository_iam_binding" "puller" {
  repository_id = yandex_container_repository.repository.id
  role          = "container-registry.images.puller"

  members = [
    "system:allUsers",
  ]
}
