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
  # appId = var.appId
  # password = var.password
  random_integer = module.resource_group.random_integer
  depends_on = [ module.vnet ]
}

# not needed for ci/cd processes
# uncomment line 34 to 37 if you provisioning for the first time or you want to deploy the helm charts
# module "helm" {
#   source = "./modules/helm"
#   depends_on = [ module.aks ]
# }


#actions workflow
        # -   name: Terraform Plan
        #     id: tf_plan
        #     working-directory: ./terraform
        #     run: |
        #       terraform plan -detailed-exitcode -out=plan.tfplan \
        #       -var="client_id=${{ secrets.AZURE_CLIENT_ID }}" \
        #       -var="client_secret=${{ secrets.AZURE_CLIENT_SECRET }}" \
        #       -var="subscription_id=${{ secrets.AZURE_SUBSCRIPTION_ID }}" \
        #       -var="tenant_id=${{ secrets.AZURE_TENANT_ID }}"
        #       echo "exit_code=$?" >> $GITHUB_ENV

        # -   name: Check Plan Status
        #     id: check_plan_status
        #     run: |
        #       if [ "$exit_code" -eq 0 ]; then
        #         echo "No changes detected. Skipping apply."
        #         exit 0
        #       elif [ "$exit_code" -eq 2 ]; then
        #         echo "Changes detected. Proceeding with apply."
        #       else
        #         echo "Error during plan. Exiting."
        #         exit 1
        #       fi
        #     env:
        #       exit_code: ${{ env.exit_code }}

        # -   name: Terraform Apply
        #     if: steps.check_plan_status.outcome == 'success' && env.exit_code == '2'
        #     working-directory: ./terraform
        #     run: terraform apply --auto-approve plan.tfplan \
        #       -var="client_id=${{ secrets.AZURE_CLIENT_ID }}" \
        #       -var="client_secret=${{ secrets.AZURE_CLIENT_SECRET }}" \
        #       -var="subscription_id=${{ secrets.AZURE_SUBSCRIPTION_ID }}" \
        #       -var="tenant_id=${{ secrets.AZURE_TENANT_ID }}"