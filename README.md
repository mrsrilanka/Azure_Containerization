US CLoud

Background:
This repo will demonstrate how to create a AKS cluster using AzrureRM and Terraform.

Prerequitites:
1. Terraform installed in the local system
2. Access to GitHub and Git installed locally
3. Azure subscription with contributor/owner roles.

Steps:
1. Clone the repo

```
git clone https://github.com/mrsrilanka/uscloud.git
```

2. make sure terraform CLI is installed
```
terraform version 
```
3. Got to the root directory of the cloned repo and format the tf files
```
terraform fmt
```
4.  initialize terraform Azure modules
```
terraform init
```
5. validate the template
```
terraform validate
```
6.  plan and save the infra changes into tfplan file
```
terraform plan -out tfplan
```
7. show the tfplan file and make it readable jq output
```
terraform show -json tfplan
terraform show -json tfplan >> tfplan.json
```
8. Format tfplan.json file
```
terraform show -json tfplan | jq '.' > tfplan.json
```
9. To view only the changes (optional)
```
cat tfplan.json | jq -r '(.resource_changes[] | [.change.actions[], .type, .change.after.name]) | @tsv'
cat tfplan.json | jq '[.resource_changes[] | {type: .type, name: .change.after.name, actions: .change.actions[]}]' 
```
10. apply the infra changes
```
terraform apply tfplan
```
11. Tp delete the infrastructure that was created
```
terraform destroy
```
