# terraform/environments/test/terraform.tfvars

subscription_id = "YOUR_SUBSCRIPTION_ID_HERE"
client_id       = "YOUR_CLIENT_ID_HERE"
client_secret   = "YOUR_CLIENT_SECRET_HERE"
tenant_id       = "YOUR_TENANT_ID_HERE"

# Resource Group / Location
location          = "YOUR_LOCATION_HERE"
resource_group    = "YOUR_RESOURCE_GROUP_HERE"
application_type  = "YOUR_APPLICATION_TYPE_HERE"
storage_account_name = "YOUR_STORAGE_ACCOUNT_NAME_HERE"
container_name       = "YOUR_CONTAINER_NAME_HERE"

# Network
virtual_network_name = "YOUR_VIRTUAL_NETWORK_NAME_HERE"
address_space        = ["10.5.0.0/16"]           # Example
address_prefix_test  = ["10.5.1.0/24"]           # Example

# Admin / VM placeholder values (if needed)
admin_username       = "YOUR_ADMIN_USERNAME_HERE"
admin_ssh_public_key = "YOUR_ADMIN_SSH_PUBLIC_KEY_HERE"
