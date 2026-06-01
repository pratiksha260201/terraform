# Terraform Learning Notes

## What is Terraform?

Terraform is an Infrastructure as Code (IaC) tool developed by HashiCorp. It is used to create, manage, and automate infrastructure using code instead of manual configuration.

Examples of infrastructure:

* EC2 (Virtual Machine)
* RDS / Aurora (Database)
* EKS (Kubernetes Cluster)
* VPC (Network)
* S3 (Storage)

---

## Why Infrastructure as Code (IaC)?

Traditionally, infrastructure is created manually through cloud consoles. Terraform automates this process using code.

Benefits:

* Automation
* Consistency
* Version Control
* Faster Deployment
* Reduced Human Errors

---

## Terraform vs Ansible

### Terraform

* Infrastructure Provisioning Tool
* Creates cloud resources
* Example: EC2, VPC, EKS, RDS

### Ansible

* Configuration Management Tool
* Manages and updates existing servers
* Installs software and configures applications

Flow:

Terraform → Creates Infrastructure

Ansible → Configures Infrastructure

---

## Terraform vs CloudFormation

### Terraform

* Multi-cloud support
* Works with AWS, Azure, GCP, Kubernetes, Docker, etc.
* Uses HCL (HashiCorp Configuration Language)

### CloudFormation

* AWS-native Infrastructure as Code service
* Creates and manages AWS resources using YAML or JSON templates

CloudFormation is AWS's alternative to Terraform.

---

## Common Cloud Services

### Compute

| Provider | Service         |
| -------- | --------------- |
| AWS      | EC2             |
| Azure    | Virtual Machine |
| GCP      | Compute Engine  |

### Storage

| Provider | Service       |
| -------- | ------------- |
| AWS      | S3            |
| Azure    | Blob Storage  |
| GCP      | Cloud Storage |

### Database

* Amazon RDS
* Amazon Aurora

### Kubernetes

* Amazon EKS (Elastic Kubernetes Service)

### Networking

* VPC (Virtual Private Cloud)

---

## Terraform Configuration Language

Terraform uses HCL (HashiCorp Configuration Language).

File Extension:

```text
.tf
```

Basic Structure:

```hcl
<block> <parameter> {

  arguments

}
```

Common Blocks:

* provider
* resource
* variable
* output
* module

---

## Terraform Workflow

### Initialize Terraform

```bash
terraform init
```

Downloads providers and initializes Terraform.

### Validate Configuration

```bash
terraform validate
```

Checks configuration syntax.

### Plan Infrastructure

```bash
terraform plan
```

Shows a preview of changes.

### Apply Changes

```bash
terraform apply
```

Create resources automatically:

```bash
terraform apply -auto-approve
```

### Destroy Resources

```bash
terraform destroy
```

Destroy automatically:

```bash
terraform destroy -auto-approve
```

---

## AWS CLI Configuration

Verify AWS CLI:

```bash
aws --version
```

Configure credentials:

```bash
aws configure
```

Required:

* Access Key ID
* Secret Access Key
* Region

AWS credentials are generally created through IAM users.

---

## Terraform State Management

Terraform stores infrastructure information in:

```text
terraform.tfstate
```

Purpose:

* Tracks resources
* Maintains infrastructure state

### Challenges

1. State file conflicts
2. Team collaboration issues

### Remote Backend

Store state file in S3.

Benefits:

* Shared state
* Backup
* Centralized management

### State Locking

Use DynamoDB for locking.

Flow:

User A
→ Runs terraform apply
→ State file locked

User B
→ Tries terraform apply
→ Access denied until lock is released

This prevents state conflicts.

---

## Terraform Workspaces

Workspaces provide isolated state files for different environments.

List workspaces:

```bash
terraform workspace list
```

Create workspace:

```bash
terraform workspace new dev
```

Switch workspace:

```bash
terraform workspace select dev
```

Example:

* default → Production
* dev → Development

---

## Terraform Modules

Modules are reusable Terraform code blocks.

Benefits:

* Reusability
* Standardization
* Easier maintenance

Example:

```hcl
module "vpc" {
  source = "./modules/vpc"
}
```

---

## VPC Components

Typical VPC Architecture:

* Public Subnet
* Private Subnet
* Route Tables
* Internet Gateway
* NAT Gateway

CIDR blocks are used to define IP ranges.

---

## Amazon EKS

EKS (Elastic Kubernetes Service) is AWS-managed Kubernetes.

Architecture:

### Control Plane

* API Server
* Scheduler
* Controller Manager
* etcd

### Worker Nodes

* EC2 Instances

Pods run on worker nodes and are managed by the control plane.

---

## EC2 Purchasing Options

| Type                | Cost           | Use Case                |
| ------------------- | -------------- | ----------------------- |
| On-Demand           | Highest        | Short-term workloads    |
| Reserved Instances  | Lower          | Long-term workloads     |
| Savings Plans       | Lower          | Flexible commitment     |
| Spot Instances      | Cheapest       | Non-critical workloads  |
| Dedicated Instances | Expensive      | Isolation requirements  |
| Dedicated Hosts     | Most Expensive | Compliance requirements |

---

## Provisioners

### User Data

Runs commands automatically when an EC2 instance starts.

### Remote Exec

Runs commands on a remote server through SSH after resource creation.

---

## Terraform Taint

Marks a resource for recreation during the next apply.

```bash
terraform taint aws_instance.web
```

---

## Terraform Graph

Displays resource dependency relationships.

```bash
terraform graph
```

---

## Best Practices

* Use Remote State Storage (S3)
* Enable State Locking (DynamoDB)
* Use Modules
* Store Secrets Securely
* Use Workspaces for Environment Isolation
* Review terraform plan before apply

---

## Conclusion

Terraform helps automate infrastructure provisioning and management across multiple cloud platforms. It provides consistency, scalability, and repeatability while reducing manual effort and configuration drift.
