module "resource_group_budget" {
  source = "../../modules/resource-group-budget"
  monitor_action_group = {
    name                = var.monitor_action_group.name
    resource_group_name = azurerm_resource_group.resource_group.name
    short_name          = var.monitor_action_group.short_name
  }
  consumption_budget_data = {
    name              = var.consumption_budget_data.name
    resource_group_id = azurerm_resource_group.resource_group.id
    time_grain        = var.consumption_budget_data.time_grain
    amount            = var.consumption_budget_data.amount
    notifications     = var.consumption_budget_data.notifications
    time_period       = var.consumption_budget_data.time_period
  }
}