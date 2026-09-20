terraform {
  backend "azurerm" {
    resource_group_name  = "staterg"
    storage_account_name = "aksinfrasa"
    container_name       = "akstfstate"
    key                  = "aks.tstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.77.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "5a35d30d-6a8d-482a-b237-15a1133eecd8"
}