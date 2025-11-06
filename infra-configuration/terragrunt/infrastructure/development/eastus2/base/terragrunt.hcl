include "environment" {
  path   = find_in_parent_folders("development.hcl")
  expose = true
}

terraform {
  source = "../../../../../..//infra-modules/deployable-units/base"
}

locals {
  variables      = include.environment.locals
  amount_50_usd  = "50"
  contact_emails = []
}

inputs = {
  resource_group_name = "gasper-dev-databricks-rg001"
  owner               = local.variables.owner
  region              = local.variables.primary_region
  environment         = local.variables.environment
  vnet_specs = {
    name          = "gasper-dev-databricks-vnet001"
    address_space = "10.150.0.0/16"
  }
  monitor_action_group = {
    name       = "gasper-dev-databricks-mag001"
    short_name = "gaz-mag001"
  }
  consumption_budget_data = {
    name       = "gasper-dev-databricks-cbd001"
    amount     = local.amount_50_usd
    time_grain = local.variables.common_vars.azurerm_consumption_budget_resource_group.time_grain.Monthly
    time_period = {
      start_date = "2025-11-01T00:00:00Z"
      end_date   = null
    }
    notifications = [
      {
        operator       = local.variables.common_vars.azurerm_consumption_budget_resource_group.notification_operator.EqualTo
        threshold      = "25"
        threshold_type = local.variables.common_vars.azurerm_consumption_budget_resource_group.notification_threshold_type.Actual
        enabled        = true
        contact_emails = local.contact_emails
      },
      {
        operator       = local.variables.common_vars.azurerm_consumption_budget_resource_group.notification_operator.EqualTo
        threshold      = "50"
        threshold_type = local.variables.common_vars.azurerm_consumption_budget_resource_group.notification_threshold_type.Actual
        enabled        = true
        contact_emails = local.contact_emails
      },
      {
        operator       = local.variables.common_vars.azurerm_consumption_budget_resource_group.notification_operator.EqualTo
        threshold      = "75"
        threshold_type = local.variables.common_vars.azurerm_consumption_budget_resource_group.notification_threshold_type.Actual
        enabled        = true
        contact_emails = local.contact_emails
      }
    ]
  }
}
