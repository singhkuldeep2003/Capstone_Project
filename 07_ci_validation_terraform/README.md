# Project 7: CI Validation for Terraform

## 1. Goal
Automate Infrastructure as Code (IaC) linting, syntax formatting, and module validation using GitHub Actions CI workflows.

## 2. Implemented CI/CD Pipeline
- **Workflow File:** `.github/workflows/terraform-ci.yml`
- **Triggers:** Push and Pull Request events to the `main` branch.
- **Matrix Strategy:** Executes parallel validation across all Terraform infrastructure modules:
  - `01_terraform-ec2-webserver`
  - `02_s3_static_website`
  - `03_cloudwatch_ec2_alarm`
  - `04_iam_user_automation`

## 3. Automated Validation Stages
1. **Setup Terraform:** Installs pinned Terraform version (`1.9.0`).
2. **Format Check (`terraform fmt -check`):** Verifies all HCL configurations adhere to canonical formatting rules.
3. **Initialization (`terraform init -backend=false -input=false`):** Installs required providers without needing live AWS credentials or remote backend state.
4. **Syntax Validation (`terraform validate`):** Verifies provider declarations, resource definitions, and variable references across modules.

## 4. Deliverables
- **Workflow Badge:** Embedded dynamic status badge in root `README.md`.
- **Pipeline Execution:** Captured successful workflow run across all matrix jobs (`pipeline_success.png`).
