output "id" {
  value = yandex_vpc_network.main.id
}

output "subnets" {
  value = {
    for k,v in yandex_vpc_subnet.main: k => {id = v.id, zone = v.zone}
  }
}
