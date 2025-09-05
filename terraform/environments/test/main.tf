# terraform/environments/test/main.tf

terraform {
  backend "azurerm" {
    storage_account_name = "YOUR_STORAGE_ACCOUNT_NAME_HERE"
    container_name       = "YOUR_CONTAINER_NAME_HERE"
    key                  = "test.terraform.tfstate"
    use_azuread_auth     = true
    # resource_group_name = "Azuredevops"
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source         = "../../modules/resource_group"
  resource_group = var.resource_group
  location       = var.location
}

module "network" {
  source               = "../../modules/network"
  address_space        = var.address_space
  location             = var.location
  virtual_network_name = var.virtual_network_name
  application_type     = var.application_type
  resource_type        = "NET"
  resource_group       = module.resource_group.resource_group_name
  address_prefix_test  = var.address_prefix_test
}

module "nsg-test" {
  source              = "../../modules/networksecuritygroup"
  location            = var.location
  application_type    = var.application_type
  resource_type       = "NSG"
  resource_group      = module.resource_group.resource_group_name
  subnet_id           = module.network.subnet_id
  address_prefix_test = var.address_prefix_test
}

module "publicip" {
  source           = "../../modules/publicip"
  location         = var.location
  application_type = var.application_type
  resource_type    = "publicip"
  resource_group   = module.resource_group.resource_group_name
}

module "vm" {
  source = "../../modules/vm"

  resource_group = var.resource_group
  location       = var.location

  subnet_id    = module.network.subnet_id
  public_ip_id = module.publicip.public_ip_id

  vm_name  = "YOUR_VM_NAME_HERE"
  vm_size  = "Standard_B1s"

  admin_username       = var.admin_username
  admin_ssh_public_key = var.admin_ssh_public_key

  tags = {
    env     = "dev"
    owner   = "hssah"
    project = "eqr"
  }
}
