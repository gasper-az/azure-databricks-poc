include "environment" {
  path   = find_in_parent_folders("development.hcl")
  expose = true
}

terraform {
  source = "../../../../../..//infra-modules/deployable-units/base"
}

locals {
  variables = include.environment.locals
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
}
