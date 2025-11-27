resource "databricks_metastore" "metastore" {
  name                                              = var.name
  storage_root                                      = var.storage_root
  owner                                             = var.owner
  region                                            = var.region
  force_destroy                                     = var.force_destroy
  delta_sharing_organization_name                   = var.delta_sharing_organization_name
  delta_sharing_recipient_token_lifetime_in_seconds = var.delta_sharing_recipient_token_lifetime_in_seconds
  delta_sharing_scope                               = var.delta_sharing_scope
}

resource "databricks_metastore_assignment" "metastore_assignment" {
  metastore_id = databricks_metastore.metastore.id
  workspace_id = var.workspace_id
}
