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

variable "databricks_workspace_id" {
  description = "The databricks workspace's ID."
  type = string
}

variable "databricks_workspace_host" {
  description = "The databricks workspace's host (url)."
  type = string
}
