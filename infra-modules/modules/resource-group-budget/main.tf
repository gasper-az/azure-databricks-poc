resource "azurerm_monitor_action_group" "monitor_action_group" {
  name                = var.monitor_action_group.name
  resource_group_name = var.monitor_action_group.resource_group_name
  short_name          = var.monitor_action_group.short_name
}

resource "azurerm_consumption_budget_resource_group" "budget_resource_group" {
  name              = var.consumption_budget_data.name
  resource_group_id = var.consumption_budget_data.resource_group_id
  amount            = var.consumption_budget_data.amount
  time_grain        = var.consumption_budget_data.time_grain

  time_period {
    start_date = var.consumption_budget_data.time_period.start_date
    end_date   = var.consumption_budget_data.time_period.end_date
  }

  dynamic "notification" {
    for_each = var.consumption_budget_data.notifications

    content {
      enabled        = notification.value.enabled
      threshold      = notification.value.threshold
      operator       = notification.value.operator
      threshold_type = notification.value.threshold_type
      contact_emails = flatten([notification.value.contact_emails])
    }
  }
}
