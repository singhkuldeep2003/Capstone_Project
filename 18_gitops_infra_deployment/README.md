# Project 18: GitOps Infra Deployment

## 1. Goal
Implement a GitOps deployment pipeline to automatically trigger and apply infrastructure updates from Pull Request (PR) merges with required environment approvals.

## 2. Pipeline Design
- **Trigger Event:** `pull_request` closed on `main` branch with `merged == true`
- **Environment Gate:** `production` environment with configured reviewer approvals
- **Execution:** Automated `terraform apply -auto-approve` inside `./18_gitops_infra_deployment`

## 3. Workflow File
- `.github/workflows/gitops_infra.yml`

## 4. Deliverables
- Proof screenshot of the GitHub Actions workflow run execution validating the apply job run.
