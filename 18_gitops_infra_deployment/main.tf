terraform {
  required_version = ">= 1.0.0"
}

resource "null_resource" "gitops_infra" {
  triggers = {
    deployment_time = timestamp()
    deployed_by     = "GitHub-Actions-GitOps"
  }

  provisioner "local-exec" {
    command = "echo 'GitOps: Infrastructure deployment triggered and applied successfully after PR approval.'"
  }
}

output "status" {
  value = "Infrastructure deployed via GitOps pipeline"
}
