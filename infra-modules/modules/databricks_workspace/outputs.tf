output "id" {
  description = "The ID of the Databricks Workspace in the Azure management plane."
  value       = azurerm_databricks_workspace.databricks_workspace.id
}

output "disk_encryption_set_id" {
  description = "The ID of Managed Disk Encryption Set created by the Databricks Workspace."
  value       = azurerm_databricks_workspace.databricks_workspace.disk_encryption_set_id
}

output "managed_disk_identity" {
  description = "A managed_disk_identity block."
  value       = azurerm_databricks_workspace.databricks_workspace.managed_disk_identity
}

output "managed_resource_group_id" {
  description = "The ID of the Managed Resource Group created by the Databricks Workspace."
  value       = azurerm_databricks_workspace.databricks_workspace.managed_resource_group_id
}

output "workspace_url" {
  description = "The workspace URL which is of the format 'adb-{workspaceId}.{random}.azuredatabricks.net'"
  value       = azurerm_databricks_workspace.databricks_workspace.workspace_url
}

output "workspace_id" {
  description = "The unique identifier of the databricks workspace in Databricks control plane."
  value       = azurerm_databricks_workspace.databricks_workspace.workspace_id
}

output "storage_account_identity" {
  description = "A storage_account_identity block."
  value       = azurerm_databricks_workspace.databricks_workspace.storage_account_identity
}
