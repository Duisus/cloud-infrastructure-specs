variable "db_info" {
  type = object({
    db_name   = string
    user_name = string
    password  = string
  })
}

variable "primary_host_zone" {
  type = string
}

resource "yandex_mdb_mongodb_cluster" "mongodb" {
  name        = "app-mongodb"
  environment = "PRESTABLE"
  network_id  = yandex_vpc_network.network.id

  cluster_config {
    version = "4.2"
  }

  database {
    name = var.db_info.db_name
  }

  user {
    name     = var.db_info.user_name
    password = var.db_info.password
    permission {
      database_name = var.db_info.db_name
    }
  }

  resources {
    resource_preset_id = "s2.micro"
    disk_size          = 16
    disk_type_id       = "network-hdd"
  }

  dynamic "host" {
    for_each = yandex_vpc_subnet.subnet
    iterator = subnet
    content {
      role             = subnet.value.zone == var.primary_host_zone ? "PRIMARY" : "SECONDARY"
      zone_id          = subnet.value.zone
      subnet_id        = subnet.value.id
      assign_public_ip = subnet.value.zone == var.primary_host_zone
    }
  }

  maintenance_window {
    type = "ANYTIME"
  }
}
