locals {
  common_vars_hcl = read_terragrunt_config(find_in_parent_folders("commons.hcl"))
  common_vars     = local.common_vars_hcl.locals
  environment     = local.common_vars.environments.dev
  primary_region  = local.common_vars.azure_region.eastus2
  owner           = local.common_vars.owner

  # TF State storage account parameters
  storage_for_state_files_rg_name        = local.common_vars.state_storages[local.environment].resource_group_name
  storage_for_state_files_name           = local.common_vars.state_storages[local.environment].storage_account_name
  storage_for_state_files_container_name = local.common_vars.state_storages[local.environment].container_name

  backend_config_base = {
    resource_group_name  = local.storage_for_state_files_rg_name
    storage_account_name = local.storage_for_state_files_name
    container_name       = local.storage_for_state_files_container_name
    key                  = "${path_relative_to_include()}/terraform.tfstate"
    use_azuread_auth     = true
    tenant_id            = get_env("TF_VAR_tenant_id")
    subscription_id      = get_env("TF_VAR_subscription_id")
    # client_id            = get_env("TF_VAR_client_id")
  }

  #   backend_config_auth = get_env("TF_VAR_oidc_enabled") == "true" ? {
  #     use_oidc   = true
  #     oidc_token = get_env("TF_VAR_oidc_token")
  #     } : {
  #     client_secret = get_env("TF_VAR_client_secret")
  #   }

  backend_config_auth = {}

  backend_config = merge(local.backend_config_base, local.backend_config_auth)
}

remote_state {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = local.backend_config
}

generate "required_providers" {
  path      = "required_providers.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  required_version = ">= 1.7.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.4.0"
    }
    databricks = {
      source = "databricks/databricks"
    }
  }
}
EOF
}

generate "azurerm_provider" {
  path      = "azurerm_provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "azurerm" {
  storage_use_azuread  = true
  tenant_id            = "${get_env("TF_VAR_tenant_id")}"
  subscription_id      = "${get_env("TF_VAR_subscription_id")}"
  features {}
}
EOF
}
