locals {
  tags = {
    environment = var.environment
    region      = var.region
    owner       = var.owner
  }
  storage_blob_data_contributor_role_name = "Storage Blob Data Contributor"
}
