output "unity_catalog_storage_account_id" {
  description = "The id of the Storage Account ID for Unity Catalog."
  value       = module.unity_catalog_storage_account.id
}

output "unity_catalog_storage_container_id" {
  description = "The id of the Storage Account ID for Unity Catalog."
  value       = module.unity_catalog_storage_container.id
}

output "databricks_access_connectors_managed_identity_id" {
  description = "The ID of the Databricks access connectors' managed identity."
  value       = module.databricks_access_connectors_managed_identity.id
}