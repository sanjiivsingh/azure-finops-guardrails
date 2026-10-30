variable "resource_group_name" {
  type        = string
  description = "Name of the resource group for FinOps monitoring assets."
  default     = "rg-finops-guardrails"
}

variable "location" {
  type        = string
  description = "Azure region for deployment."
  default     = "eastus"
}

variable "monthly_budget_amount" {
  type        = number
  description = "Monthly budget limit in specified currency."
  default     = 1000
}

variable "alert_emails" {
  type        = list(string)
  description = "Notification emails for budget threshold breaches."
  default     = ["finops-alerts@example.com"]
}

variable "mandatory_tags" {
  type        = list(string)
  description = "List of required tags enforced via Azure Policy."
  default     = ["CostCenter", "Environment", "Owner", "Project"]
}

variable "tags" {
  type        = map(string)
  description = "Resource tags."
  default = {
    Environment = "production"
    ManagedBy   = "Terraform"
    Project     = "azure-finops-guardrails"
  }
}
