# Terraform Tutorial - Beginner to Advanced

## Beginner

### 1. Introduction to Terraform
- What is Infrastructure as Code (IaC)
- Terraform vs other IaC tools (CloudFormation, Pulumi, Ansible)
- Terraform architecture and how it works
- Providers, resources, and state

### 2. Installation & Setup
- Installing Terraform (Windows, macOS, Linux)
- Configuring AWS CLI and credentials
- IDE setup (VS Code + Terraform extension)

### 3. Your First Terraform Configuration
- Writing a basic `.tf` file
- `terraform init`, `plan`, `apply`, `destroy`
- Understanding the execution workflow
- Resource arguments and attributes

### 4. Providers
- What are providers
- Configuring AWS provider
- Multiple provider configurations
- Provider versioning and constraints

### 5. Variables
- Input variables (`variable` block)
- Variable types (string, number, bool, list, map, object)
- Default values
- Variable validation rules
- `terraform.tfvars` and `.auto.tfvars`
- Environment variables (`TF_VAR_`)

### 6. Outputs
- Output values
- Referencing outputs from other modules
- Sensitive outputs

### 7. State Management Basics
- What is Terraform state
- Local state vs remote state
- `terraform.tfstate` file
- `terraform show` and `terraform state list`

---

## Intermediate

### 8. Remote State & Backends
- S3 + DynamoDB backend configuration
- State locking and consistency
- `terraform force-unlock`
- State file encryption

### 9. Tfvars & Environments
- Structuring environments (dev, stg, prod)
- Using `-var-file` flag
- Environment-specific configurations
- Workspace vs directory-based environments

### 10. Data Sources
- Querying existing infrastructure
- `data` blocks
- Using data sources with resources (AMIs, VPCs, subnets)

### 11. Resource Dependencies
- Implicit dependencies (resource references)
- Explicit dependencies (`depends_on`)
- Resource graph and execution order

### 12. Provisioners
- `local-exec` and `remote-exec`
- `file` provisioner
- When to use (and avoid) provisioners
- `null_resource` and triggers

### 13. Terraform Modules
- What are modules
- Creating reusable modules
- Module inputs and outputs
- Local vs remote modules (Terraform Registry, Git, S3)
- Module versioning

### 14. Expressions & Functions
- String interpolation and templates
- Conditional expressions (`condition ? true : false`)
- Built-in functions (`lookup`, `merge`, `concat`, `file`, `templatefile`)
- `for` expressions
- Splat expressions (`[*]`)

### 15. Loops & Dynamic Blocks
- `count` meta-argument
- `for_each` meta-argument
- `dynamic` blocks
- When to use `count` vs `for_each`

---

## Advanced

### 16. Workspaces
- Terraform workspaces overview
- Creating and switching workspaces
- Workspace-based environment management
- `terraform.workspace` variable

### 17. State Management Advanced
- `terraform import` (importing existing resources)
- `terraform state mv`, `rm`, `pull`, `push`
- State file migration between backends
- Handling state drift

### 18. Terraform Cloud & Enterprise
- Remote execution
- Sentinel policies
- Cost estimation
- VCS integration
- Team access and governance

### 19. CI/CD with Terraform
- Terraform in GitHub Actions
- Terraform in GitLab CI
- Terraform in Jenkins
- Automated plan and apply workflows
- Pull request automation (Atlantis)

### 20. Advanced Module Patterns
- Module composition
- Nested modules
- Module testing
- Publishing modules to Terraform Registry

### 21. Custom Providers
- When to build a custom provider
- Provider SDK (Terraform Plugin Framework)
- CRUD operations in providers

### 22. Security Best Practices
- Managing secrets (Vault, AWS Secrets Manager, SSM Parameter Store)
- Least privilege IAM policies for Terraform
- State file security and encryption
- Sensitive variables and outputs
- `.gitignore` for Terraform projects

### 23. Testing Terraform Code
- `terraform validate`
- `terraform fmt`
- `tflint` (linting)
- `checkov` and `tfsec` (security scanning)
- Terratest (integration testing with Go)
- `terraform plan` as a test

### 24. Performance & Scaling
- Targeting specific resources (`-target`)
- Parallelism (`-parallelism`)
- Splitting large configurations
- Managing large state files
- Refresh and plan optimization

### 25. Advanced Patterns
- Zero-downtime deployments with Terraform
- Blue/Green and Canary deployments
- Terraform with Kubernetes
- Terraform with Docker
- Multi-cloud infrastructure
- Terragrunt for DRY configurations

---

## Project Ideas

| Level | Project |
|-------|---------|
| Beginner | Deploy a single EC2 instance with security group |
| Beginner | Create an S3 bucket with versioning and lifecycle rules |
| Intermediate | VPC with public/private subnets, NAT gateway, and ALB |
| Intermediate | Multi-environment setup using tfvars and modules |
| Advanced | Full EKS cluster with node groups and IAM roles |
| Advanced | Multi-region disaster recovery setup |
| Advanced | CI/CD pipeline deploying Terraform with state locking |

---

## Useful Commands Reference

```bash
terraform init          # Initialize working directory
terraform plan          # Preview changes
terraform apply         # Apply changes
terraform destroy       # Destroy infrastructure
terraform fmt           # Format code
terraform validate      # Validate configuration
terraform output        # Show outputs
terraform state list    # List resources in state
terraform import        # Import existing resource
terraform workspace     # Manage workspaces
terraform force-unlock  # Release stuck state lock
```

---

## Recommended Resources

- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [Terraform Registry](https://registry.terraform.io/)
- [AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Best Practices](https://www.terraform-best-practices.com/)
- [Terraform Up & Running (Book)](https://www.terraformupandrunning.com/)
