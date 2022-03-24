#__________________________________________________________
#
# Terraform Cloud Organization
#__________________________________________________________

variable "tfc_organization" {
  default     = "Netnology-MINT"
  description = "Terraform Cloud Organization."
  type        = string
}


#______________________________________________
#
# Terraform Cloud kubeconfig Workspace
#______________________________________________

variable "ws_kubeconfig" {
  default     = "new_cluster"
  description = "Intersight Kubernetes Service (IKS) kubeconfig Workspace Name.  The default value will be set to {cluster_name}_kubeconfig by the tfe variable module."
  type        = string
}
variable "apikey" {
  type        = string
  description = "API Key"
}
variable "secretkey" {
  type        = string
  description = "Secret Key or file location"
}
variable "cluster_name" {
  type        = string
  description = "Intersight Kubernetes Service Cluster Name"
}
