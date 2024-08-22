# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "my_project_resources" {
  name     = "my-infra-resources"
  location = "westus"
}

# Create a virtual network
resource "azurerm_virtual_network" "my_project_vnet" {
  name                = "my-infra-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.my_project_resources.location
  resource_group_name = azurerm_resource_group.my_project_resources.name
}

# Create a subnet
resource "azurerm_subnet" "my_project_subnet" {
  name                 = "my-infra-subnet"
  resource_group_name  = azurerm_resource_group.my_project_resources.name
  virtual_network_name = azurerm_virtual_network.my_project_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Output the subnet ID
output "subnet_id" {
  value = azurerm_subnet.my_project_subnet.id
}

terraform {
  backend "azurerm" {
    resource_group_name   = "my-infra-resources"
    storage_account_name  = "myinfrastorage24"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
