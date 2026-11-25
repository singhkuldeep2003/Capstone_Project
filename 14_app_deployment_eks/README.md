# Project 14: App Deployment using EKS

## 1. Goal
Deploy containerized workloads to Amazon Elastic Kubernetes Service (EKS) and expose the application via an external AWS Load Balancer.

## 2. Infrastructure & Components
- **Cluster:** Amazon EKS (`project14-new`, `ap-south-1`)
- **Namespace:** `kuldeep-p14`
- **Container Registry:** Amazon ECR (`590507089733.dkr.ecr.ap-south-1.amazonaws.com/capstone-web-app:latest`)
- **Deployment:** 2 Replicas distributed across managed worker nodes
- **Service Type:** `LoadBalancer` (AWS Classic ELB)
- **Public Endpoint:** `http://a9f6943a3bebb44c1be07c3a5540abf6-594531685.ap-south-1.elb.amazonaws.com`

## 3. Deployment Manifests & Execution
```bash
# Apply deployment and service
kubectl apply -f deployment.yaml

# Inspect resources
kubectl get pods -n kuldeep-p14 -o wide
kubectl get svc capstone-web-service -n kuldeep-p14
```

## 4. Deliverables
- Captured public access screenshot validating traffic ingestion through the external Load Balancer DNS.
