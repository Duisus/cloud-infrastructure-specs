resource "yandex_vpc_network" "network" {
  name = "app-network"
}

variable "zones" {
  type = set(string)
}

resource "yandex_vpc_subnet" "subnet" {
  for_each = var.zones

  name           = "app-subnet-${each.value}"
  zone           = each.value
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["10.2.0.0/16"]
}
