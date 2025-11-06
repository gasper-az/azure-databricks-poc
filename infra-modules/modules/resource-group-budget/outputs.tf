output "monitor_action_group_id" {
  description = "The id of the monitor action group."
  value       = azurerm_monitor_action_group.monitor_action_group.id
}

output "budget_resource_group_id" {
  description = "The id of the resource group's budget."
  value       = azurerm_consumption_budget_resource_group.budget_resource_group.id
}
