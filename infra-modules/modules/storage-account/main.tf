resource "azurerm_storage_account" "storage_account" {
  name                          = var.name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  account_kind                  = var.account_kind
  account_tier                  = var.account_tier
  account_replication_type      = var.account_replication_type
  access_tier                   = var.access_tier
  is_hns_enabled                = var.is_hns_enabled
  min_tls_version               = var.min_tls_version
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags
}
