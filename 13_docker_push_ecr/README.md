# Project 13: Build Image and Push to ECR

## 1. Goal
Publish containerized application images to AWS Elastic Container Registry (ECR) for distribution and container orchestration.

## 2. Registry Details
- **Registry Provider:** Amazon Elastic Container Registry (ECR)
- **AWS Region:** `ap-south-1`
- **Repository Name:** `capstone-web-app`
- **Registry ID:** `590507089733`
- **Image Tags:** `latest`, `v1`

## 3. Workflow Commands
```bash
# Authenticate Docker client to ECR
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 590507089733.dkr.ecr.ap-south-1.amazonaws.com

# Tag image
docker tag capstone-docker-app:v1 [590507089733.dkr.ecr.ap-south-1.amazonaws.com/capstone-web-app:v1](https://590507089733.dkr.ecr.ap-south-1.amazonaws.com/capstone-web-app:v1)
docker tag capstone-docker-app:v1 [590507089733.dkr.ecr.ap-south-1.amazonaws.com/capstone-web-app:latest](https://590507089733.dkr.ecr.ap-south-1.amazonaws.com/capstone-web-app:latest)

# Push to registry
docker push [590507089733.dkr.ecr.ap-south-1.amazonaws.com/capstone-web-app:v1](https://590507089733.dkr.ecr.ap-south-1.amazonaws.com/capstone-web-app:v1)
docker push [590507089733.dkr.ecr.ap-south-1.amazonaws.com/capstone-web-app:latest](https://590507089733.dkr.ecr.ap-south-1.amazonaws.com/capstone-web-app:latest)
```

## 4. Verification Evidence
Queried `aws ecr describe-images` confirming status `ACTIVE` and image tags `["v1", "latest"]`.
