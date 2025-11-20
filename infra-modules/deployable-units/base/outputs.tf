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

output "public_subnet_id" {
  description = "The ID of the public subnet."
  value       = module.databricks_public_subnet.id
}

output "public_private_id" {
  description = "The ID of the private subnet."
  value       = module.databricks_private_subnet.id
}

output "public_subnet_nsg_id" {
  description = "The ID of the public subnet's NSG."
  value       = azurerm_network_security_group.public_subnet_nsg.id
}

output "private_subnet_nsg_id" {
  description = "The ID of the private subnet's NSG."
  value       = azurerm_network_security_group.private_subnet_nsg.id
}

output "public_subnet_nsg_association_id" {
  description = "The ID of the public subnet NSG association."
  value       = azurerm_subnet_network_security_group_association.public_subnet_nsg_association.id
}

output "private_subnet_nsg_association_id" {
  description = "The ID of the private subnet NSG association."
  value       = azurerm_subnet_network_security_group_association.private_subnet_nsg_association.id
}

output "databricks_workspace_id" {
  description = "The unique identifier of the databricks workspace in Databricks control plane."
  value       = module.databricks_workspace.workspace_id
}

output "databricks_workspace_url" {
  description = "The workspace URL which is of the format 'adb-{workspaceId}.{random}.azuredatabricks.net'"
  value       = module.databricks_workspace.workspace_url
}
