# Project 12: Infrastructure CI Trigger (Terraform Plan)

## 1. Goal
Automate infrastructure planning stage triggers upon code push and preserve generated execution plans as downloadable CI pipeline artifacts.

## 2. Pipeline Enhancements
- **Workflow Trigger:** Push and pull request events targeting `main`.
- **Plan Generation:** Added automated `terraform plan` generation step across all matrix modules.
- **Artifact Management:** Utilized `actions/upload-artifact@v4` to store generated execution plans (`tfplan.txt`) with a 5-day retention policy.

## 3. Deliverables
- CI pipeline run with successful execution of matrix plan validation.
- Captured screenshot displaying successful job execution and uploaded plan artifacts.
