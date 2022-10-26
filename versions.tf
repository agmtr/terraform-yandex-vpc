terraform {
  required_version = ">= 1.3"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.80"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.3"
    }
  }
}
