module "unity_catalog_storage_account" {
  source                        = "../../modules/storage-account"
  name                          = var.databricks_uc.storage_account.name
  resource_group_name           = var.resource_group_name
  location                      = var.region
  account_kind                  = var.databricks_uc.storage_account.account_kind
  account_tier                  = var.databricks_uc.storage_account.account_tier
  account_replication_type      = var.databricks_uc.storage_account.account_replication_type
  access_tier                   = var.databricks_uc.storage_account.access_tier
  is_hns_enabled                = var.databricks_uc.storage_account.is_hns_enabled
  min_tls_version               = var.databricks_uc.storage_account.min_tls_version
  public_network_access_enabled = var.databricks_uc.storage_account.public_network_access_enabled
  tags                          = local.tags
}

module "unity_catalog_storage_container" {
  source                = "../../modules/storage-container"
  name                  = var.databricks_uc.storage_container.name
  storage_account_id    = module.unity_catalog_storage_account.id
  container_access_type = var.databricks_uc.storage_container.container_access_type
}

resource "azurerm_role_assignment" "identity_data_contributor" {
  scope                = module.unity_catalog_storage_account.id
  role_definition_name = local.storage_blob_data_contributor_role_name
  principal_id         = module.databricks_access_connectors_managed_identity.principal_id
}

locals {
  storage_root = format("abfss://%s@%s.dfs.core.windows.net/",
    module.unity_catalog_storage_container.name,
  module.unity_catalog_storage_account.name)
}

module "metastore" {
  source        = "../../modules/databricks-metastore"
  name          = var.databricks_uc.metastore.name
  owner         = var.databricks_uc.metastore.owner
  storage_root  = local.storage_root
  region        = var.region
  force_destroy = true
  workspace_id  = var.databricks_workspace_id
  providers = {
    databricks = databricks
  }
}
