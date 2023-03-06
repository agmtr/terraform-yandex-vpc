provider "yandex" {
  folder_id = var.folder_id
}

module "vpc" {
  source                 = "git::https://github.com/agmtr/terraform-yandex-vpc.git?ref=v1.0.0"
  create_default_subnets = false
  subnets = {
    "subnet-a" = {
      cidr = [ "10.101.10.0/24" ]
      zone = "ru-central1-a"
    }
    "subnet-b" = {
      cidr = [ "10.101.20.0/24" ]
      zone = "ru-central1-b"
    }
    "subnet-c" = {
      cidr = [ "10.101.30.0/24" ]
      zone = "ru-central1-c"
    }
  }
  static_routes = {
    to_dc_lan_through_vpn_host = {
      destination_prefix = "10.100.0.0/24"
      next_hop_address   = "10.101.10.11"
    }
  }
}
