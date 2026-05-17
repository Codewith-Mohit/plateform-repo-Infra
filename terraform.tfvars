# Terraform variable values for development environment

# Development subscription ID (where resources will be created)
development_subscription_id = "53b96680-2c85-499c-b6ef-db43e176ef53"

# Resource Group
resource_group_name = "rg-development"
location            = "westeurope"


additional_tags = {
  CostCenter = "app-Infrastructure"
  Owner      = "Platform-Team"
}

ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFMUQ4m4S5NpUqhF/eNsCkduE8amjNRsz84paPuchzMc mohit@mohit-IdeaPad"