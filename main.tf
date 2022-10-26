locals {
  default_labels = {
    terraform        = "true"
    terraform_module = basename(abspath(path.root))
  }
  subnets = var.create_default_subnets ? merge(var.default_subnets, var.subnets) : var.subnets
}

resource "random_id" "main" {
  byte_length = 4
}

resource "yandex_vpc_network" "main" {
  name        = var.name != null ? "${var.name}-${random_id.main.hex}" : "vpc-${random_id.main.hex}"
  description = var.desc
  labels      = merge(local.default_labels, var.labels)

  lifecycle {
    create_before_destroy = true
  }
}

resource "yandex_vpc_gateway" "main" {
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "main" {
  network_id = yandex_vpc_network.main.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.main.id
  }

  dynamic "static_route" {
    for_each = var.static_routes
    content {
      destination_prefix = static_route.value.destination_prefix
      next_hop_address = static_route.value.next_hop_address
    }
  }
}

resource "yandex_vpc_subnet" "main" {
  for_each = local.subnets

  name           = "${each.key}-${each.value.zone}-${random_id.main.hex}"
  description    = each.value.desc
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = each.value.cidr
  zone           = each.value.zone
  labels         = merge(local.default_labels, var.labels)
  route_table_id = yandex_vpc_route_table.main.id

  lifecycle {
    create_before_destroy = true
  }
}
