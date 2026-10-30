# Verification Evidence & CI Audit

## Repository Status
- **Validation State**: Statically Validated & CI Verified
- **Target Platform**: Microsoft Azure (Azure Cost Management, Consumption Budgets, Azure Policy)
- **Terraform Compatibility**: `>= 1.9.0`
- **AzureRM Provider**: `~> 4.0`

## Continuous Integration Verification
All Terraform configurations pass static syntax, formatting, and secret scanning:
- **CI Pipeline**: [GitHub Actions Workflow](https://github.com/sanjiivsingh/azure-finops-guardrails/actions)
- **Local Validation Command**:
  ```bash
  terraform fmt -check
  terraform init -backend=false
  terraform validate
  ```

## Monthly Cost Profile

| Resource | Scope / Unit | Cost |
| :--- | :--- | :--- |
| Azure Consumption Budget | Subscription scope | $0.00 (Native free tier) |
| Azure Policy (Tag Audits) | Subscription scope | $0.00 (Native free tier) |
| Azure Monitor Action Group | FinOps Email Alerts | $0.00 (< 1,000 emails/month free) |
| **Total Monthly Cost** | Control Plane Only | **$0.00 / month** |
