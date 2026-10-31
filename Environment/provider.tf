terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.77.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "b3cee294-daf0-4add-80fd-af9b8c01c64a"
}