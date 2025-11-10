module "vnet" {
  source              = "../../modules/vnet"
  name                = var.vnet_specs.name
  location            = var.region
  resource_group_name = azurerm_resource_group.resource_group.name
  address_space       = var.vnet_specs.address_space
  tags                = local.tags
}

module "databricks_public_subnet" {
  source               = "../../modules/subnet"
  name                 = var.databricks_subnets.public_subnet.name
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = module.vnet.name
  address_prefixes     = var.databricks_subnets.public_subnet.address_prefixes
  delegations = [
    {
      name = "databricks"
      service_delegation = {
        name = "Microsoft.Databricks/workspaces"
        actions = [
          "Microsoft.Network/virtualNetworks/subnets/join/action",
          "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
          "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
        ]
      }
    }
  ]
}

resource "azurerm_network_security_group" "public_subnet_nsg" {
  name                = var.databricks_subnets.public_subnet.nsg_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  tags                = local.tags
}

resource "azurerm_subnet_network_security_group_association" "public_subnet_nsg_association" {
  subnet_id                 = module.databricks_public_subnet.id
  network_security_group_id = azurerm_network_security_group.public_subnet_nsg.id
}

module "databricks_private_subnet" {
  source               = "../../modules/subnet"
  name                 = var.databricks_subnets.private_subnet.name
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = module.vnet.name
  address_prefixes     = var.databricks_subnets.private_subnet.address_prefixes
  delegations = [
    {
      name = "databricks"
      service_delegation = {
        name = "Microsoft.Databricks/workspaces"
        actions = [
          "Microsoft.Network/virtualNetworks/subnets/join/action",
          "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
          "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
        ]
      }
    }
  ]
}

resource "azurerm_network_security_group" "private_subnet_nsg" {
  name                = var.databricks_subnets.private_subnet.nsg_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  tags                = local.tags
}

resource "azurerm_subnet_network_security_group_association" "private_subnet_nsg_association" {
  subnet_id                 = module.databricks_private_subnet.id
  network_security_group_id = azurerm_network_security_group.private_subnet_nsg.id
}
