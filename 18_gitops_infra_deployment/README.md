# Project 18: GitOps Infra Deployment

## 1. Goal
Trigger automated infrastructure updates from Pull Request (PR) merges with required environment approvals.

## 2. Architecture & Workflow
- **Pipeline Engine:** GitHub Actions (`.github/workflows/gitops_infra.yml`)
- **Trigger Condition:** Pull request merged into `main` (`github.event.pull_request.merged == true`)
- **Gate/Approval:** GitHub Environment `production` with required reviewer approval
- **Execution:** Automated `terraform apply -auto-approve` executing within `./18_gitops_infra_deployment`

## 3. Deliverables
- Proof screenshot showing the GitHub Actions workflow execution and successful apply job run.
