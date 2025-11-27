variable "resource_group_id" {
  description = "The id of the resource group where the resources will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the resources will be created."
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

variable "databricks_workspace_id" {
  description = "The databricks workspace's ID."
  type        = string
}

variable "databricks_workspace_host" {
  description = "The databricks workspace's host (url)."
  type        = string
}

variable "databricks_uc" {
  description = <<EOT
    databricks_uc = {
      access_conector = {
        name:   (string). The name of the access connector for Databricks Unity Catalog.
        managed_identity_name:   (String). The name of the managed identity for the access connector.
      }
      metastore = {
        name:   (string). The name of the metastore.
        owner:  (string). The metastore's owner.
      }
      storage_account = {
        name: (string). The name of the storage account.
        account_kind: (string). Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Defaults to StorageV2.
        account_tier: (string). Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created.
        account_replication_type: (string). Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa.
        access_tier:  (string). Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot, Cool, Cold and Premium. Defaults to Hot.
        is_hns_enabled: (bool). Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2. Changing this forces a new resource to be created.
        min_tls_version:  (string). The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, TLS1_2 and TLS1_3. Defaults to TLS1_2 for new storage accounts.
        public_network_access_enabled:  (bool). Whether the public network access is enabled? Defaults to true.
      }
      storage_container = {
        name: (string). The name of the Container which should be created within the Storage Account. Changing this forces a new resource to be created.
        container_access_type:  (string). The Access Level configured for this Container. Possible values are blob, container or private.
      }
    }
  EOT
  type = object({
    access_conector = object({
      name                  = string
      managed_identity_name = string
    })
    metastore = object({
      name  = string
      owner = string
    })
    storage_account = object({
      name                          = string
      account_kind                  = string
      account_tier                  = string
      account_replication_type      = string
      access_tier                   = string
      is_hns_enabled                = bool
      min_tls_version               = string
      public_network_access_enabled = bool
    })
    storage_container = object({
      name                  = string
      container_access_type = string
    })
  })
}
