resource_group_name = "aks_tf_rg"
location            = "Central US"                      # USCloud test subscription is limited to Central US and South Central US
cluster_name        = "uscloud-aks"                     # Re-name the name of the AKS cluster to a desired name
kubernetes_version  = "1.30.2"                          # Use the desired supported version of AKS from documentation
system_node_count   = 3
node_resource_group = "aks_tf_resources_rg"
