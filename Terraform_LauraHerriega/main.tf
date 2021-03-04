
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.1"
    }
  }
}

# crea un service principal y rellena los siguientes datos para autenticar
#Datos service principal creado
provider "azurerm" {
  features {}
  subscription_id = "3540db22-fb0b-419b-99eb-da17aae5fdcd" # Subscription ID
  client_id       = "c98c6044-e43d-4180-9fc3-314457deb116" # appID
  client_secret   = "qmuQe-32OwHm-FM_OGw0LvAzDtG541Q-k~"   # password
  tenant_id       = "899789dc-202f-44b4-8472-a6d40f9eb440" # tenant
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group

resource "azurerm_resource_group" "rg" {
    name     =  "kubernetes_rg"
    location = var.location

    tags = {
        environment = "CP2"
    }

}

# Storage account
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account

resource "azurerm_storage_account" "stAccount" {
    name                     = "staccountlauraherriega" 
    resource_group_name      = azurerm_resource_group.rg.name
    location                 = azurerm_resource_group.rg.location
    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
        environment = "CP2"
    }

}
