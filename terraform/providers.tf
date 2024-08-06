terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.70.0"
    }
  }

  backend "azurerm" {
    resource_group_name   = "tfstate-RG"
    storage_account_name  = "terraformstate43"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

provider "random" {} 














# provider "helm" {
#   kubernetes {
#     config_path = "~/.kube/config"
#   }
  
# }