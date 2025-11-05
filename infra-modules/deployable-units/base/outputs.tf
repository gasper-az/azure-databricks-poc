output "resource_group_id" {
  description = "The resource group id."
  value       = azurerm_resource_group.resource_group.id
}

output "resource_group_name" {
  description = "The resource group name."
  value       = azurerm_resource_group.resource_group.name
}

output "vnet_id" {
  description = "The VNet id."
  value       = module.vnet.id
}

output "vnet_name" {
  description = "The VNet name."
  value       = module.vnet.name
}