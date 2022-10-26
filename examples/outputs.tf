output "id" {
  value = module.vpc.id
}

output "subnets" {
  value = module.vpc.subnets
}

output "hello_world" {
  value = "Hello, World!"
}