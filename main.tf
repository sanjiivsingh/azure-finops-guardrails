data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "finops" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_monitor_action_group" "finops" {
  name                = "ag-finops-budget-alerts"
  resource_group_name = azurerm_resource_group.finops.name
  short_name          = "finops-ops"
  tags                = var.tags

  dynamic "email_receiver" {
    for_each = var.alert_emails
    content {
      name                    = "FinOpsNotify-${email_receiver.key}"
      email_address           = email_receiver.value
      use_common_alert_schema = true
    }
  }
}

resource "azurerm_consumption_budget_subscription" "monthly" {
  name            = "budget-subscription-monthly-guardrail"
  subscription_id = data.azurerm_subscription.current.id
  amount          = var.monthly_budget_amount
  time_grain      = "Monthly"

  time_period {
    start_date = formatdate("YYYY-MM-01'T'00:00:00Z", timestamp())
  }

  notification {
    enabled        = true
    threshold      = 80.0
    operator       = "GreaterThanOrEqualTo"
    threshold_type = "Forecasted"
    contact_emails = var.alert_emails
    contact_groups = [azurerm_monitor_action_group.finops.id]
  }

  notification {
    enabled        = true
    threshold      = 100.0
    operator       = "GreaterThanOrEqualTo"
    threshold_type = "Actual"
    contact_emails = var.alert_emails
    contact_groups = [azurerm_monitor_action_group.finops.id]
  }

  notification {
    enabled        = true
    threshold      = 110.0
    operator       = "GreaterThanOrEqualTo"
    threshold_type = "Actual"
    contact_emails = var.alert_emails
    contact_groups = [azurerm_monitor_action_group.finops.id]
  }

  lifecycle {
    ignore_changes = [time_period]
  }
}

# Azure Policy: Enforce mandatory resource group tags
resource "azurerm_policy_definition" "enforce_tags" {
  name         = "audit-mandatory-finops-tags"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Audit Mandatory FinOps Cost Tags"
  description  = "Audits resources missing mandatory cost allocation tags: CostCenter, Owner, Environment."

  metadata = jsonencode({
    category = "Cost Management"
    version  = "1.0.0"
  })

  policy_rule = jsonencode({
    if = {
      allOf = [
        for tag in var.mandatory_tags : {
          field  = "[concat('tags[', '${tag}', ']')]"
          exists = "false"
        }
      ]
    }
    then = {
      effect = "audit"
    }
  })
}

resource "azurerm_subscription_policy_assignment" "enforce_tags" {
  name                 = "assign-audit-finops-tags"
  subscription_id      = data.azurerm_subscription.current.id
  policy_definition_id = azurerm_policy_definition.enforce_tags.id
  display_name         = "Audit Mandatory FinOps Cost Tags"
  description          = "Enforces FinOps tagging standards across subscription resources."
}
