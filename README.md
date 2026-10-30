# Azure FinOps Guardrails (Terraform)

[![Status](https://img.shields.io/badge/Status-Statically%20Validated-informational.svg)](#)
[![FinOps Guardrails CI](https://github.com/sanjiivsingh/azure-finops-guardrails/actions/workflows/ci.yml/badge.svg)](https://github.com/sanjiivsingh/azure-finops-guardrails/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Enterprise FinOps guardrails as Terraform code: subscription consumption budgets, multi-tier forecast/actual spend alerts, Azure Policy tag enforcement, and Infracost CI shift-left cost automation.

---

## 🏛️ Architecture Overview

```mermaid
flowchart TD
    subgraph Subscription["🏢 Azure Subscription Scope"]
        BUDGET["Consumption Budget (Monthly Limit)"]
        POLICY["Azure Policy (Tag Audit: CostCenter, Owner)"]
    end

    subgraph Alerts["🔔 Proactive Notification Engine"]
        F80["80% Forecasted Threshold Alert"]
        A100["100% Actual Spend Alert"]
        A110["110% Overrun Alert"]
        AG["Action Group (FinOps Engineering Team)"]
    end

    subgraph CI["🚀 Pull Request Shift-Left"]
        INFRA["Infracost GitHub Action Diff"]
        PR["PR Breakdown & Cost Review"]
    end

    BUDGET --> F80 --> AG
    BUDGET --> A100 --> AG
    BUDGET --> A110 --> AG
    INFRA --> PR
```

---

## 🌟 Key Features

- **Multi-Stage Budget Alerts**: Proactively alerts on 80% forecasted spend before overages happen, plus 100% and 110% actual spend thresholds.
- **Tagging Governance as Code**: Azure Policy definition auditing missing `CostCenter`, `Owner`, `Environment`, and `Project` tags.
- **Shift-Left FinOps**: Infracost workflow demonstrating automated pull-request cost impact estimation.
- **Zero Running Infrastructure Cost**: Built entirely on Azure native control plane resources ($0.00/month).

---

## 🚀 Quickstart

### Prerequisites
- Terraform `>= 1.9.0`
- Azure CLI `>= 2.60.0`
- Azure Subscription Contributor or Cost Management Contributor role

### Deployment
```bash
git clone https://github.com/sanjiivsingh/azure-finops-guardrails.git
cd azure-finops-guardrails

terraform init
terraform plan -out=tfplan
terraform apply tfplan
```

---

## 💰 Cost Profile & Teardown

- **Monthly Cost**: $0.00 / month (Azure Cost Management budgets and Policy evaluations incur no charge).
- **Teardown**:
  ```bash
  terraform destroy -auto-approve
  ```

---

## 🔒 Security & Support
See [SECURITY.md](SECURITY.md) and [ARCHITECTURE.md](docs/ARCHITECTURE.md).
