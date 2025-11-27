# Azure Databricks POC

## Configuration

1. `az login`

2. Configure the next environment variables:

- `TF_VAR_tenant_id`: Azure Tenant ID.
  - Configuration (PowerShell): `$env:TF_VAR_tenant_id="<value>"`
- `TF_VAR_subscription_id`: Azure Subscription ID.
  - Configuration (PowerShell): `$env:TF_VAR_subscription_id="<value>"`
- `TF_VAR_databricks_account_id`: Databricks Account ID
  - Configuration (PowerShell): `$env:TF_VAR_databricks_account_id`

3. More info and examples:

- [Terraform databricks examples](https://github.com/databricks/terraform-databricks-examples)
