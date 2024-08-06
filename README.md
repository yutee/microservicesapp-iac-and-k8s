# Overview
A microservices-based application packaged using kubernetes is provided. There is need to automate it's deployment using cloud services and DevOps core practices like automation, Iac, monitoring/logging and CI/CD. There is also need to ensure security measures and proper encryption on the hosted application. 
To meet the requirements, the following tools/platforms will be used:
- Azure Kubernetes Service
- Terraform
- Github Actions

### The Application
The provided application uses a microservices architecture, it is deployed using kubernetes and.

### The Workflow
The architecture of the workflow
![image of architecture]()

### The Process
__Prerequisites__
Should you want to recreate the process using the code provided on this repo, these are things you will need to setup first:
- Helm
- Az CLI (configured to an active azure subscription)
- Kubectl
- Terraform
- Github Actions
- Let's Encrypt

__Steps__
-Terraform
-Deployments and setups
--apply manifest files
--setup ingress
--setup prom and grafana
--cert manager and lets encrypt
-Github actions

-explain process i used to solve the problem-
-explain the terraform and where it takes you to-
-explain what you did after the terraform-
-explain setting up the other parts-

### The End?
DevOps never ends, as software is ever changing and evolving, there is need for continous integration of new code into existing one.

__Continous Integration and Continous Deployment__
-explain ci/cd workflow-
-show demo-

__Summary__
Thank you.



--- from online readme ---
*In normal cases, the cluster will be created by IaC tool and after that team would use a helm package manager externally to manage the charts for the Kubernetes cluster. Recently I came across helm providers in Terraform by which you can manage the charts along with Infra provisioning , which is quite handy. For this project, I also used Azure Blob Storage as Terraform remote backend to save my statefile.
Helm providers in Terraform are basically used to manage helm charts in a Kubernetes cluster*

__Next Step?__
- configure terraform for helm to install
    - nginx ingress controller
    - prometheus (the one that comes with grafana and alert manager)
    - cert manager
- apply changes and ensure site is up
- configure the ingress to expose grafana and also configure the cert manager for encryption
- implement ci/cd
- documentation
    - explain the project
    - explain architecture of the app
    - explain terraform configuration
    - explain steps and method taken to solve the problem
    - explain steps if one wants to recreate the project
    - explain what the ci/cd pipeline does
---