terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id            = "00000000-0000-0000-0000-000000000000" # This will be overridden by environment variables
}

module "network" {
  source = "../../"

  resource_group_name = "example-rg"
  location            = "East US"

  virtual_network_name = "example-vnet"
  address_space        = ["10.0.0.0/16"]

  subnets = {
    "subnet1" = "10.0.1.0/24"
    "subnet2" = "10.0.2.0/24"
  }

  tags = {
    environment = "example"
  }
}
