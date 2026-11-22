# Project 11: Infra Changes with Branching Policy

## 1. Goal
Enforce Git branching strategies and peer pull request (PR) review workflows for Infrastructure as Code (IaC) updates.

## 2. Branching Policy Implementation
- **Source Branch:** `feature/infra-tags-update`
- **Target Base Branch:** `main`
- **Infrastructure Change:** Standardized resource tags mapping via `01_terraform-ec2-webserver/tags.tf`.

## 3. Workflow Validation
1. Feature branch created and pushed to remote origin.
2. Pull Request submitted targeting `main`.
3. Automated GitHub Actions CI workflow triggers and passes matrix validation checks across modules.
4. Pull Request reviewed, approved, and merged via merge commit.
