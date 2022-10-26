provider "yandex" {
  folder_id = var.folder_id
}

module "vpc" {
  source                 = "../"
  create_default_subnets = true
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
}
