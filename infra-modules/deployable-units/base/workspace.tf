module "databricks_workspace" {
  source              = "../../modules/databricks_workspace"
  name                = var.databricks_workspace_specs.name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.region
  sku                 = var.databricks_workspace_specs.sku
  tags                = local.tags
  custom_parameters = {
    virtual_network_id                                   = module.vnet.id
    private_subnet_name                                  = module.databricks_private_subnet.name
    private_subnet_network_security_group_association_id = azurerm_subnet_network_security_group_association.private_subnet_nsg_association.id
    public_subnet_name                                   = module.databricks_public_subnet.name
    public_subnet_network_security_group_association_id  = azurerm_subnet_network_security_group_association.public_subnet_nsg_association.id
    storage_account_name                                 = var.databricks_workspace_specs.storage_account.name
    storage_account_sku_name                             = var.databricks_workspace_specs.storage_account.sku
  }
}
