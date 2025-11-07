variable "resource_group_name" {
  description = "The name of the resource group."
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

variable "vnet_specs" {
  description = <<EOT
    vnet_specs = {
        name:           String. The Virtual Network name.
        address_space:  String. The Virtual Network address space.
    }
  EOT
  type = object({
    name          = string
    address_space = string
  })
}

variable "monitor_action_group" {
  description = <<EOT
        monitor_action_group: {
            name (string): The name of the monitor action group.
            short_name (string): The short name of the monitor action group.
        }
    EOT
  type = object({
    name       = string
    short_name = string
  })
}

variable "consumption_budget_data" {
  description = <<EOT
    consumption_budget_data: {
        name (string): The name of the consumption budget data.
        amount (number): The total amount of cost to track with the budget.
        time_grain (string): The time covered by a budget. Tracking of the amount will be reset based on the time grain. Must be one of BillingAnnual, BillingMonth, BillingQuarter, Annually, Monthly and Quarterly. Defaults to Monthly. Changing this forces a new resource to be created.
        time_period (object): {
            start_date (string): The start date for the budget. The start date must be first of the month and should be less than the end date. Budget start date must be on or after June 1, 2017. Future start date should not be more than twelve months. Past start date should be selected within the timegrain period. Changing this forces a new Resource Group Consumption Budget to be created.
            end_date (optional - string): The end date for the budget. If not set this will be 10 years after the start date.
        }
        notifications (list of objects): {
            operator (string): The comparison operator for the notification. Must be one of EqualTo, GreaterThan, or GreaterThanOrEqualTo.
            threshold (string): Threshold value associated with a notification. Notification is sent when the cost exceeded the threshold. It is always percent and has to be between 0 and 1000.
            threshold_type (string): The type of threshold for the notification. This determines whether the notification is triggered by forecasted costs or actual costs. The allowed values are Actual and Forecasted.
            enabled (bool): Should the notification be enabled?
            contact_emails (list of string): Specifies a list of email addresses to send the budget notification to when the threshold is exceeded.
        }
    }
  EOT

  type = object({
    name       = string
    amount     = number
    time_grain = string
    time_period = object({
      start_date = string
      end_date   = optional(string)
    })
    notifications = list(object({
      threshold      = number
      operator       = string
      threshold_type = string
      enabled        = bool
      contact_emails = list(string)
    }))
  })
}

variable "databricks_subnets" {
  description = <<EOT
    databricks_subnets: {
      public_subnet: {
        name (string): The subnet's name.
        address_prefixes: The subnet's address prefix.
      }
      private_subnet: {
        name (string): The subnet's name.
        address_prefixes: The subnet's address prefix.
      }
    }
  EOT
  type = object({
    public_subnet = object({
      name             = string
      address_prefixes = string
    })
    private_subnet = object({
      name             = string
      address_prefixes = string
    })
  })
}
