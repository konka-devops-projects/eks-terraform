module "eks_cluster" {
  source = "../modules/eks"

  environment = var.common_vars["environment"]
  project     = var.common_vars["project_name"]
  common_tags = var.common_vars["common_tags"]

  bootstrap_cluster_creator_admin_permissions = var.eks["bootstrap_cluster_creator_admin_permissions"]
  eks_version                                 = var.eks["eks_version"]
  subnet_ids                                  = module.eks-vpc.private_subnet_ids
  security_group_ids                          = [module.control_plane.sg_id]
  endpoint_private_access                     = var.eks["endpoint_private_access"]
  endpoint_public_access                      = var.eks["endpoint_public_access"]
  public_access_cidrs                         = var.eks["public_access_cidrs"]
}