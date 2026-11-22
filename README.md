# Multi-Cloud Capstone Project

![Terraform CI Validation](https://github.com/singhkuldeep2003/Capstone_Project/actions/workflows/terraform-ci.yml/badge.svg)

Automated cloud infrastructure provisioned with Terraform on AWS and Linux.

## Modules
- `01_terraform-ec2-webserver`: Deploys an Nginx web server on EC2.
- `02_s3_static_website`: Provisions an S3 bucket configured for static web hosting.
- `03_cloudwatch_ec2_alarm`: Configures EC2 CloudWatch metrics and alarm triggers.
- `04_iam_user_automation`: Provisions restricted S3 read-only IAM policies and user attachments.
- `05_secure_linux_permissions`: Discretionary access control and group permission boundaries on Linux.
- `06_version_control_infrastructure`: Git feature branching, commits, and Pull Request tracking.
- `07_ci_validation`: GitHub Actions continuous integration validating Terraform code formatting and syntax.
