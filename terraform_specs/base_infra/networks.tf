resource "yandex_vpc_network" "network" {
  name = "app-network"
}

variable "zones_and_cidr_blocks" {
  type = map(string)
}

resource "yandex_vpc_subnet" "subnet" {
  for_each = var.zones_and_cidr_blocks

  name           = "app-subnet-${each.key}"
  zone           = each.key
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = [each.value]
}
