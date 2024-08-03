terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.70.0"
    }
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