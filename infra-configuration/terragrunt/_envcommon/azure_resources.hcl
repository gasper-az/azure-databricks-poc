locals {
  azurerm_consumption_budget_resource_group = {
    time_grain = {
      BillingAnnual  = "BillingAnnual"
      BillingMonth   = "BillingMonth"
      BillingQuarter = "BillingQuarter"
      Annually       = "Annually"
      Monthly        = "Monthly"
      Quarterly      = "Quarterly"
    }
    notification_operator = {
      EqualTo              = "EqualTo"
      GreaterThan          = "GreaterThan"
      GreaterThanOrEqualTo = "GreaterThanOrEqualTo"
    }
    notification_threshold_type = {
      Actual     = "Actual"
      Forecasted = "Forecasted"
    }
  }
  databricks_workspace = {
    sku = {
      standard = "standard"
      premium  = "premium"
      trial    = "trial"
    }
  }
  storage_account = {
    sku = {
      Standard_LRS    = "Standard_LRS"
      Standard_GRS    = "Standard_GRS"
      Standard_RAGRS  = "Standard_RAGRS"
      Standard_GZRS   = "Standard_GZRS"
      Standard_RAGZRS = "Standard_RAGZRS"
      Standard_ZRS    = "Standard_ZRS"
      Premium_LRS     = "Premium_LRS"
      Premium_ZRS     = "Premium_ZRS"
    }
  }
}
