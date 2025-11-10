resource "azurerm_databricks_workspace" "databricks_workspace" {
  name                                  = var.name
  resource_group_name                   = var.resource_group_name
  location                              = var.location
  sku                                   = var.sku
  tags                                  = var.tags
  public_network_access_enabled         = var.public_network_access_enabled
  load_balancer_backend_address_pool_id = var.load_balancer_backend_address_pool_id
  custom_parameters {
    machine_learning_workspace_id                        = var.custom_parameters.machine_learning_workspace_id
    nat_gateway_name                                     = var.custom_parameters.nat_gateway_name
    public_ip_name                                       = var.custom_parameters.public_ip_name
    no_public_ip                                         = var.custom_parameters.no_public_ip
    public_subnet_name                                   = var.custom_parameters.public_subnet_name
    public_subnet_network_security_group_association_id  = var.custom_parameters.public_subnet_network_security_group_association_id
    private_subnet_name                                  = var.custom_parameters.private_subnet_name
    private_subnet_network_security_group_association_id = var.custom_parameters.private_subnet_network_security_group_association_id
    storage_account_name                                 = var.custom_parameters.storage_account_name
    storage_account_sku_name                             = var.custom_parameters.storage_account_sku_name
    virtual_network_id                                   = var.custom_parameters.virtual_network_id
    vnet_address_prefix                                  = var.custom_parameters.vnet_address_prefix
  }
}
