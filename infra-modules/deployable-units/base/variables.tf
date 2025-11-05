variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "region" {
  description = "The deployment's region."
  type        = string
  default     = "eastus2"
}

variable "environment" {
  description = "The environment where the resources will be deployed."
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "The resource's owner."
  type        = string
  default     = "Gaspar Acevedo Zain"
}

variable "vnet_specs" {
  description = <<EOT
    vnet_specs = {
        name:           String. The Virtual Network name.
        address_space:  String. The Virtual Network address space.
    }
  EOT
  type = object({
    name          = string
    address_space = string
  })
}
