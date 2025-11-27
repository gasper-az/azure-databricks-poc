variable "name" {
  description = "The name of metastore."
  type        = string
}

variable "storage_root" {
  description = "Path on cloud storage account, where managed databricks_table are stored. If the URL contains special characters, such as space, &, etc., they should be percent-encoded (space -> %20, etc.). Change forces creation of a new resource. If no storage_root is defined for the metastore, each catalog must have a storage_root defined."
  type        = string
}

variable "region" {
  description = "The region of the metastore."
  type        = string
}

variable "owner" {
  description = "Username/groupname/sp application_id of the metastore owner."
  type        = string
}

variable "delta_sharing_scope" {
  description = "Required along with delta_sharing_recipient_token_lifetime_in_seconds. Used to enable delta sharing on the metastore. Valid values: INTERNAL, INTERNAL_AND_EXTERNAL. INTERNAL only allows sharing within the same account, and INTERNAL_AND_EXTERNAL allows cross account sharing and token based sharing."
  type        = string
  default     = null
}

variable "delta_sharing_recipient_token_lifetime_in_seconds" {
  description = "Required along with delta_sharing_scope. Used to set expiration duration in seconds on recipient data access tokens. Set to 0 for unlimited duration."
  type        = number
  default     = null
}

variable "delta_sharing_organization_name" {
  description = "The organization name of a Delta Sharing entity. This field is used for Databricks to Databricks sharing. Once this is set it cannot be removed and can only be modified to another valid value. To delete this value please taint and recreate the resource."
  type        = string
  default     = null
}

variable "force_destroy" {
  description = "Destroy metastore regardless of its contents."
  type        = bool
  default     = false
}

variable "workspace_id" {
  description = "Id of the workspace for the assignment."
  type        = string
}