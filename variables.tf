variable "name" {
  type    = string
  default = null
}

variable "desc" {
  type    = string
  default = null
}

variable "labels" {
  type    = map(string)
  default = {}
}

variable "create_default_subnets" {
  type    = bool
  default = false
}

variable "subnets" {
  type = map(object({
    desc = optional(string)
    cidr = list(string)
    zone = string
  }))
  default = {}
}

variable "default_subnets" {
  type = map(object({
    desc = optional(string)
    cidr = list(string)
    zone = string
  }))
  default = {
    default-a = {
      cidr = ["10.128.0.0/24"]
      zone = "ru-central1-a"
    }
    default-b = {
      cidr = ["10.129.0.0/24"]
      zone = "ru-central1-b"
    }
    default-c = {
      cidr = ["10.130.0.0/24"]
      zone = "ru-central1-c"
    }
  }
}

variable "static_routes" {
  type = map(object({
    destination_prefix = string
    next_hop_address = string
  }))
  default = {}
}
