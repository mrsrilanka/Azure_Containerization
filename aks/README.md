# Azure AKS Deployment automation Terraform stack

Background:
This repo will demonstrate how to create a AKS cluster using AzrureRM and Terraform.

Prerequitites:
1. Terraform installed in the local system
2. Access to GitHub and Git installed locally
3. Azure subscription with contributor/owner roles.
4. JSON processor jq installed (optional) 

Steps:
1. Clone the repo

```
git clone https://github.com/mrsrilanka/uscloud.git
```

2. Make sure terraform CLI is installed
```
terraform version 
```
3. Go to the root directory of the cloned repo and format the tf files
```
terraform fmt
```
4. Authenticate the azure cloud
```
az login
```
5.  Initialize terraform Azure modules
```
terraform init
```
6. validate the template
```
terraform validate
```
7.  plan and save the infra changes into tfplan file
```
terraform plan -out tfplan
```
8. show the tfplan file and make it readable jq output
```
terraform show -json tfplan
```

```
terraform show -json tfplan >> tfplan.json
```
9. Format tfplan.json file
```
terraform show -json tfplan | jq '.' > tfplan.json
```
10. To view only the changes (optional)
```
cat tfplan.json | jq -r '(.resource_changes[] | [.change.actions[], .type, .change.after.name]) | @tsv'
cat tfplan.json | jq '[.resource_changes[] | {type: .type, name: .change.after.name, actions: .change.actions[]}]' 
```
11. apply the infra changes
```
terraform apply tfplan
```
Output will look like this 
```
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

aks_fqdn = "uscloud-aks-mlbg474r.hcp.centralus.azmk8s.io"
aks_id = "/subscriptions/xxxxxxxxxx-xxxx-xxxx-xxxxxxxxxxxxxx/resourceGroups/aks_terraform_rg/providers/Microsoft.ContainerService/managedClusters/uscloud-aks"
aks_node_rg = "aks_terraform_resources_rg"
```
### Azure Portal view 

<img width="828" alt="2024-08-15 09_14_22-Kubernetes services - Microsoft Azure and 17 more pages - Work - Microsoft​ Edge" src="https://github.com/user-attachments/assets/4f2f67dd-a2ef-4b1c-9aff-087aa2dc0a53">

### Console view

<img width="713" alt="2024-08-15 10_44_13-Editing uscloud_README md at main · mrsrilanka_uscloud and 9 more pages - manwit" src="https://github.com/user-attachments/assets/858dc4bc-a074-4e3d-97ed-9e3fc78ded08">

12. To delete the infrastructure that was created
```
terraform destroy
```

## Note
Feel free to fork and submit a PR upstream for any changes that needed to make 

Resources:
[Terraform AzureARM](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool)

