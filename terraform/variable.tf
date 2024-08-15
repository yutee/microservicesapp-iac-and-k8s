# remote repo
variable "appId" {
  description = "The Azure AD Application ID"
}

variable "password" {
  description = "The Azure AD Application Password"
}

# github actions
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "subscription_id" {}