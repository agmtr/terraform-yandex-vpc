# Usage

```
module "vpc" {
  source                 = "git::https://github.com/agmtr/terraform-yandex-vpc.git?ref=<version>"
  create_default_subnets = true
  subnets = {
    test = {
      cidr = ["10.10.0.0/24"]
      zone = "ru-central1-a"
    }
  }
}
