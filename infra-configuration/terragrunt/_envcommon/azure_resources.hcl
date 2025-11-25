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
    access_tier = {
      Hot     = "Hot"
      Cool    = "Cool"
      Cold    = "Cold"
      Premium = "Premium"
    }
    account_kind = {
      BlobStorage      = "BlobStorage"
      BlockBlobStorage = "BlockBlobStorage"
      FileStorage      = "FileStorage"
      Storage          = "Storage"
      StorageV2        = "StorageV2"
    }
    account_replication_type = {
      LRS    = "LRS"
      GRS    = "GRS"
      RAGRS  = "RAGRS"
      ZRS    = "ZRS"
      GZRS   = "GZRS"
      RAGZRS = "RAGZRS"
    }
    account_tier = {
      Standard = "Standard"
      Premium  = "Premium"
    }
    min_tls_version = {
      TLS1_0 = "TLS1_0"
      TLS1_1 = "TLS1_1"
      TLS1_2 = "TLS1_2"
      TLS1_3 = "TLS1_3"
    }
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
  storage_container = {
    access_type = {
      blob      = "blob"
      container = "container"
      private   = "private"
    }
  }
}
