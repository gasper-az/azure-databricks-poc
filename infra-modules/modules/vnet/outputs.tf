output "id" {
  description = "The Virtual Network ID."
  value       = azurerm_virtual_network.vnet.id
}

output "name" {
  description = "The Virtual Network Name."
  value       = azurerm_virtual_network.vnet.name
}
