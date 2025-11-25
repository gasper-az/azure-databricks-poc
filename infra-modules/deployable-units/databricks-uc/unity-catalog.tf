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
