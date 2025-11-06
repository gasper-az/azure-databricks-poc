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
}
