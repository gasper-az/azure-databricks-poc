locals {
  # General
  owner = "Gaspar Acevedo Zain"

  # regions
  azure_region_hcl = read_terragrunt_config("../_envcommon/azure-regions.hcl")
  azure_region     = local.azure_region_hcl.locals.azure_regions

  # environments
  environments_hcl = read_terragrunt_config("../_envcommon/environments.hcl")
  environments     = local.environments_hcl.locals.environments

  # azure resources
  azure_resources_hcl                       = read_terragrunt_config("../_envcommon/azure_resources.hcl")
  azurerm_consumption_budget_resource_group = local.azure_resources_hcl.locals.azurerm_consumption_budget_resource_group
  databricks_workspace                      = local.azure_resources_hcl.locals.databricks_workspace
  storage_account                           = local.azure_resources_hcl.locals.storage_account
  storage_container                         = local.azure_resources_hcl.locals.storage_container

  # tflint
  tflint_config = {
    commands = ["plan"]
    execute  = ["tflint"]
  }

  # Storages for state files
  state_storages_hcl = read_terragrunt_config("../_envcommon/state-file-storages.hcl")
  state_storages     = local.state_storages_hcl.locals.state_storage
}
