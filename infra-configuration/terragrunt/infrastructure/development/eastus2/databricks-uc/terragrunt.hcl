include "environment" {
  path   = find_in_parent_folders("development.hcl")
  expose = true
}

include "databricks_account_provider" {
  path   = find_in_parent_folders("databricks-account-provider.hcl")
  expose = true
}

dependency "base" {
  config_path = "..//base"
}

terraform {
  source = "../../../../../..//infra-modules/deployable-units/databricks-uc"
}

locals {
  variables      = include.environment.locals
}

inputs = {
  owner               = local.variables.owner
  region              = local.variables.primary_region
  environment         = local.variables.environment
  databricks_workspace_id = dependency.base.outputs.databricks_workspace_id
  databricks_workspace_host = dependency.base.outputs.databricks_workspace_url
}
