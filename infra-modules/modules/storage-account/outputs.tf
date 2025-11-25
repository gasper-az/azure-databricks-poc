output "id" {
  description = "The ID of the Storage Account."
  value       = azurerm_storage_account.storage_account.id
}

output "primary_location" {
  description = "The primary location of the storage account."
  value       = azurerm_storage_account.storage_account.primary_location
}

output "secondary_location" {
  description = "The secondary location of the storage account."
  value       = azurerm_storage_account.storage_account.secondary_location
}

output "primary_blob_endpoint" {
  description = "The endpoint URL for blob storage in the primary location."
  value       = azurerm_storage_account.storage_account.primary_blob_endpoint
}
