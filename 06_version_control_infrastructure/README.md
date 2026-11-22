# Project 6: Version Control Infrastructure

## 1. Goal
Track Terraform infrastructure changes systematically using Git branching, commits, and GitHub Pull Request workflows.

## 2. Implemented Workflow
1. **Branching Strategy:** Created feature branch `feature/ec2-tags-and-monitoring-update` from `main`.
2. **Infrastructure Changes:** Introduced `tags.tf` local tags module to enforce governance across deployed resources.
3. **Remote Collaboration:** Pushed branch to remote GitHub repository and opened Pull Request against `main`.
4. **Code Review & Auditing:** Pull Request enables peer review, Terraform plan inspection, and controlled merging.
