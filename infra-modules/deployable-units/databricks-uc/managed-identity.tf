module "databricks_access_connectors_managed_identity" {
  source              = "../../modules/user_managed_identity"
  name                = var.databricks_uc.access_conector.managed_identity_name
  location            = var.region
  resource_group_name = var.resource_group_name
  tags                = local.tags
}

resource "azurerm_databricks_access_connector" "access_connector" {
  name                = var.databricks_uc.access_conector.name
  resource_group_name = var.resource_group_name
  location            = var.region
  identity {
    type = "UserAssigned"
    identity_ids = [
      module.databricks_access_connectors_managed_identity.id
    ]
  }
}
