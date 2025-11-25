output "id" {
  description = "The ID of the User Assigned Identity."
  value       = azurerm_user_assigned_identity.user_assigned_identity.id
}

output "client_id" {
  description = "The ID of the app associated with the Identity."
  value       = azurerm_user_assigned_identity.user_assigned_identity.client_id
}

output "principal_id" {
  description = "The ID of the Service Principal object associated with the created Identity."
  value       = azurerm_user_assigned_identity.user_assigned_identity.principal_id
}

output "tenant_id" {
  description = "The ID of the Tenant which the Identity belongs to."
  value       = azurerm_user_assigned_identity.user_assigned_identity.tenant_id
}
