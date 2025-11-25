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
  variables = include.environment.locals
}

inputs = {
  owner                     = local.variables.owner
  region                    = local.variables.primary_region
  environment               = local.variables.environment
  resource_group_id         = dependency.base.outputs.resource_group_id
  resource_group_name       = dependency.base.outputs.resource_group_name
  databricks_workspace_id   = dependency.base.outputs.databricks_workspace_id
  databricks_workspace_host = dependency.base.outputs.databricks_workspace_url
  databricks_uc = {
    access_conector = {
      name                  = "gasper-dev-databricks-ac001"
      managed_identity_name = "gasper-dev-databricks-mi001"
    }
    storage_account = {
      name                          = "gasperdevucsa001"
      account_kind                  = local.variables.common_vars.storage_account.account_kind.StorageV2
      account_tier                  = local.variables.common_vars.storage_account.account_tier.Standard
      account_replication_type      = local.variables.common_vars.storage_account.account_replication_type.LRS
      access_tier                   = local.variables.common_vars.storage_account.access_tier.Hot
      is_hns_enabled                = false
      min_tls_version               = local.variables.common_vars.storage_account.min_tls_version.TLS1_2
      public_network_access_enabled = true
    }
    storage_container = {
      name                  = "gasperdevucsc001"
      container_access_type = local.variables.common_vars.storage_container.access_type.private
    }
  }
}
