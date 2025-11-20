generate "databricks_account_provider" {
  path      = "databricks_account_provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "databricks" {
  alias      = "azure_account"
  host       = "https://accounts.azuredatabricks.net"
  account_id = "${get_env("TF_VAR_databricks_account_id")}"
  auth_type  = "azure-cli"
}
EOF
}
