# terraform/environments/test/terraform.tfvars

subscription_id = var.subscription_id
client_id       = var.client_id
client_secret   = var.client_secret
tenant_id       = var.tenant_id

# Resource Group / Location
storage_account_name = var.storage_account_name
container_name       = var.container_name

location         = var.location
resource_group   = var.resource_group
application_type = var.application_type

# Network
virtual_network_name = "myVNet"
address_space        = ["10.5.0.0/16"]           # Example
address_prefix_test  = ["10.5.1.0/24"]           # Example

# Admin / VM placeholder values (if needed)
#admin_username       = "YOUR_ADMIN_USERNAME_HERE"
#admin_ssh_public_key = "YOUR_ADMIN_SSH_PUBLIC_KEY_HERE"
