# Architecture Decision Record (ADR) - FinOps Guardrails

## Context
Cloud engineering environments require proactive financial governance to eliminate surprise bills, allocate costs to business units via mandatory tags, and shift cost estimation left into developer pull requests.

## Decisions

### 1. Multi-Tiered Subscription Budgets
- **Decision**: Configure consumption budgets with 3 proactive triggers: 80% forecasted, 100% actual, and 110% actual spend.
- **Rationale**: Forecasted alerts allow engineering leads to remediate runaway spend before month-end overages occur.

### 2. Policy-Driven Tag Enforcement
- **Decision**: Azure Policy initiative auditing mandatory cost tags (`CostCenter`, `Environment`, `Owner`, `Project`).
- **Rationale**: Enables reliable Azure Cost Management breakdown by team and application tier without breaking existing infrastructure pipelines.

### 3. Pull Request Cost Gates via Infracost
- **Decision**: Integrate Infracost CI workflow evaluating pull request resource diffs against baseline.
- **Rationale**: Shifts financial visibility directly into code reviews before `terraform apply` executes.
