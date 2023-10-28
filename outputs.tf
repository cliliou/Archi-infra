# output "container_ipv4_address" {
#   value = azurerm_container_app.ContainerAppAPI1.outbound_ip_addresses
# }

output "public_ip_address" {
  value = join("", ["http://", azurerm_public_ip.public_ip, ":", var.port])
}