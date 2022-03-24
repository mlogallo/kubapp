#__________________________________________________________
#
# Get Outputs from the kubeconfig Workspace
#__________________________________________________________

terraform {
  required_providers {
    intersight = {
      source = "ciscodevnet/intersight"
      version = "1.0.18"
    }
  }
}
   
provider "intersight" {
  apikey    = var.apikey
  secretkey = var.secretkey
  endpoint = "https://intersight.com"
}


data "terraform_remote_state" "kubeconfig" {
    backend = "remote"
  config = {
    organization = var.tfc_organization
    workspaces = {
      name = var.ws_kubeconfig
    }
  }
}




data "intersight_kubernetes_cluster" "kubeconfig" {


    
}

  
  
locals {
  # IKS Cluster Name
  cluster_name = "new_cluster" 
  # Kubernetes Configuration File
  kubeconfig = yamldecode(data.intersight_kubernetes_cluster.kubeconfig.results[0].kube_config)

}


#_____________________________________________________________________
#
# Deploy the Hello-Kubernetes Application Pod using the Helm Provider
#_____________________________________________________________________

resource "helm_release" "hello_iks_app" {
  name      = "helloiksapp"
  namespace = "default"
  chart     = "https://prathjan.github.io/helm-chart/helloiks-0.1.0.tgz"
  set {
    name  = "MESSAGE"
    value = "Hello Intersight Kubernetes Service from Terraform Cloud for Business!!"
  }
}
