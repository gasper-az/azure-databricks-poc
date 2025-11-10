variable "name" {
  description = "Specifies the name of the Databricks Workspace resource. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which the Databricks Workspace should exist. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource has to be created. Changing this forces a new resource to be created."
  type        = string
}

variable "load_balancer_backend_address_pool_id" {
  description = "Resource ID of the Outbound Load balancer Backend Address Pool for Secure Cluster Connectivity (No Public IP) workspace with managed virtual network. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "sku" {
  description = "The sku to use for the Databricks Workspace. Possible values are standard, premium, or trial."
  type        = string
  default     = "standard"

  validation {
    condition     = contains(["standard", "premium", "trial"], var.sku)
    error_message = "Invalid sky. Possible values are standard, premium, trial."
  }
}

variable "public_network_access_enabled" {
  description = "Allow public access for accessing workspace. Set value to false to access workspace only via private link endpoint. Possible values include true or false. Defaults to true."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "custom_parameters" {
  description = <<EOT
    custom_parameters: {
        machine_learning_workspace_id (string): Optional. The ID of a Azure Machine Learning workspace to link with Databricks workspace. Changing this forces a new resource to be created.
        nat_gateway_name (string): Optional. Name of the NAT gateway for Secure Cluster Connectivity (No Public IP) workspace subnets (only for workspace with managed virtual network). Defaults to nat-gateway. Changing this forces a new resource to be created.
        public_ip_name (string): Optional. Name of the Public IP for No Public IP workspace with managed virtual network. Defaults to nat-gw-public-ip. Changing this forces a new resource to be created.
        no_public_ip (bool): Optional. Are public IP Addresses not allowed? Possible values are true or false. Defaults to true.
        public_subnet_name (string): Optional. The name of the Public Subnet within the Virtual Network. Required if virtual_network_id is set. Changing this forces a new resource to be created.
        public_subnet_network_security_group_association_id (string): Optional. The resource ID of the azurerm_subnet_network_security_group_association resource which is referred to by the public_subnet_name field. This is the same as the ID of the subnet referred to by the public_subnet_name field. Required if virtual_network_id is set.
        private_subnet_name (string): Optional. The name of the Private Subnet within the Virtual Network. Required if virtual_network_id is set. Changing this forces a new resource to be created.
        private_subnet_network_security_group_association_id (string): Optional. The resource ID of the azurerm_subnet_network_security_group_association resource which is referred to by the private_subnet_name field. This is the same as the ID of the subnet referred to by the private_subnet_name field. Required if virtual_network_id is set.
        storage_account_name (string): Optional. Default Databricks File Storage account name. Defaults to a randomized name(e.g. dbstoragel6mfeghoe5kxu). Changing this forces a new resource to be created.
        storage_account_sku_name (string): Optional. Storage account SKU name. Possible values include Standard_LRS, Standard_GRS, Standard_RAGRS, Standard_GZRS, Standard_RAGZRS, Standard_ZRS, Premium_LRS or Premium_ZRS. Defaults to Standard_LRS.
        virtual_network_id (string): Optional. The ID of a Virtual Network where this Databricks Cluster should be created. Changing this forces a new resource to be created.
        vnet_address_prefix (string): Optional. Address prefix for Managed virtual network. Defaults to 10.139. Changing this forces a new resource to be created.
    }
    EOT
  type = object({
    machine_learning_workspace_id                        = optional(string)
    nat_gateway_name                                     = optional(string, "nat-gw-public-ip")
    public_ip_name                                       = optional(string)
    no_public_ip                                         = optional(bool, true)
    public_subnet_name                                   = optional(string)
    public_subnet_network_security_group_association_id  = optional(string)
    private_subnet_name                                  = optional(string)
    private_subnet_network_security_group_association_id = optional(string)
    storage_account_name                                 = optional(string)
    storage_account_sku_name                             = optional(string, "Standard_LRS")
    virtual_network_id                                   = optional(string)
    vnet_address_prefix                                  = optional(string, "10.139")
  })

  validation {
    condition     = contains(["Standard_LRS", "Standard_GRS", "Standard_RAGRS", "Standard_GZRS", "Standard_RAGZRS", "Standard_ZRS", "Premium_LRS", "Premium_ZRS"], var.custom_parameters.storage_account_sku_name)
    error_message = "Invalid storage account sku. Possible values include Standard_LRS, Standard_GRS, Standard_RAGRS, Standard_GZRS, Standard_RAGZRS, Standard_ZRS, Premium_LRS or Premium_ZRS."
  }
}
