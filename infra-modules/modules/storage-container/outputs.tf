output "id" {
  description = "The ID of the Storage Container."
  value       = azurerm_storage_container.storage_container.id
}

output "name" {
  description = "The name of the Storage Container."
  value       = azurerm_storage_container.storage_container.name
}
