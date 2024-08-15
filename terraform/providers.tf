terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.70.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "= 2.12.1"
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

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

provider "random" {} 

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"  # path to kubeconfig file
  }
}













# provider "helm" {
#   kubernetes {
#     config_path = "~/.kube/config"
#   }
  
# }