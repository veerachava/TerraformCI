terraform {
  required_version = ">=1.3.8"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.5.0"
    }
  }
  cloud {
    organization = "PrabhaPati"
    workspaces {
      name = "TerraformCI"
    }
  }
}

provider "azurerm" {
  features {}
  #subscription_id = subscription_id
  #client_id       = client_id
  #client_secret   = client_secret
  #tenant_id       = tenant_id
}

resource "azurerm_resource_group" "rg" {
  name     = "TFRG1"
  location = "UK West"
}

resource "azurerm_storage_account" "tfstr" {
  name                     = "tfstracct001"
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  resource_group_name      = azurerm_resource_group.rg.name
}
