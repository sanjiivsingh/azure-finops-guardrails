output "budget_id" {
  description = "The ID of the Subscription Consumption Budget."
  value       = azurerm_consumption_budget_subscription.monthly.id
}

output "action_group_id" {
  description = "The ID of the FinOps Alert Action Group."
  value       = azurerm_monitor_action_group.finops.id
}

output "policy_assignment_id" {
  description = "The ID of the Tagging Policy Assignment."
  value       = azurerm_subscription_policy_assignment.enforce_tags.id
}
