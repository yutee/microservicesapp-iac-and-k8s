module "resource_group" {
  source = "./modules/resource_group"
}

module "acr" {
  source = "./modules/acr"
  rg_name = module.resource_group.rg_name
  rg_location = module.resource_group.rg_location
  random_integer = module.resource_group.random_integer
  depends_on = [ module.resource_group ]
}

module "vnet" {
  source = "./modules/vnet"
  rg_name = module.resource_group.rg_name
  rg_location = module.resource_group.rg_location
  random_integer = module.resource_group.random_integer
  depends_on = [ module.resource_group ]
}

module "aks" {
  source = "./modules/aks"
  rg_name = module.resource_group.rg_name
  rg_location = module.resource_group.rg_location
  vnet_subnet1_id = module.vnet.subnet1_id
  appId = var.appId
  password = var.password
  random_integer = module.resource_group.random_integer
  depends_on = [ module.vnet ]
}

# not needed for ci/cd processes
# uncomment line 34 to 37 if you provisioning for the first time or you want to deploy the helm charts
# module "helm" {
#   source = "./modules/helm"
#   depends_on = [ module.aks ]
# }
