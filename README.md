# 💳 Azure FinOps Guardrails (Terraform)

[![Terraform 1.9+](https://img.shields.io/badge/Terraform-1.9+-844FBA?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure Provider v4+](https://img.shields.io/badge/AzureRM-v4.0+-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
[![CI/CD Validation](https://github.com/sanjiivsingh/azure-finops-guardrails/actions/workflows/ci.yml/badge.svg)](https://github.com/sanjiivsingh/azure-finops-guardrails/actions)
[![Status: Statically Validated](https://img.shields.io/badge/Status-FinOps_--_Statically_Validated-10B981?style=for-the-badge)](https://github.com/sanjiivsingh/azure-finops-guardrails)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

> **Reference Architecture · Statically Validated**  
> Enterprise FinOps guardrails as Terraform code: subscription consumption budgets, multi-tier forecast/actual spend alerts, Azure Policy tag enforcement, and Infracost CI shift-left cost automation. Detailed verification logs are documented in [docs/EVIDENCE.md](docs/EVIDENCE.md) and architectural patterns in [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md).

---

## 🏛️ Architecture Overview

```mermaid
flowchart TD
    subgraph Subscription["Azure Subscription Scope"]
        BUDGET["Consumption Budget (Monthly Limit)"]
        POLICY["Azure Policy (Tag Audit: CostCenter, Owner)"]
    end

    subgraph Alerts["Proactive Notification Engine"]
        F80["80% Forecasted Threshold Alert"]
        A100["100% Actual Spend Alert"]
        A110["110% Overrun Alert"]
        AG["Action Group (FinOps Engineering Team)"]
    end

    subgraph CI["Pull Request Shift-Left"]
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
terraform fmt -check
terraform validate
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

## 👨‍💻 Author & Cloud Consultant

**Sanjeev Singh**  
Senior Azure Cloud Architect & DevSecOps Platform Engineer  
* 🌐 **Portfolio**: [sanjeevsingh.oneps.in](https://sanjeevsingh.oneps.in)  
* 💼 **LinkedIn**: [linkedin.com/in/sanjiivsingh](https://linkedin.com/in/sanjiivsingh)  
* 🐙 **GitHub**: [github.com/sanjiivsingh](https://github.com/sanjiivsingh)

---

## 📄 License
This project is open-source under the [MIT License](LICENSE).
