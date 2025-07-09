aws_region = "ap-south-1"
common_vars = {
  environment  = "dev"
  project_name = "eks"
  common_tags = {
    "Project"     = "EKS-Cluster"
    "Environment" = "Dev"
    "ManagedBy"   = "Terraform"
    "Owner"       = "Sivaramakrishna"
  }
}

vpc = {
  vpc_cidr            = "172.17.0.0/16"
  azs                 = ["ap-south-1a", "ap-south-1b"]
  public_subnet_cidr  = ["172.17.0.0/20", "172.17.16.0/20"]
  private_subnet_cidr = ["172.17.32.0/20", "172.17.48.0/20"]
  db_subnet_cidr      = ["172.17.64.0/20", "172.17.80.0/20"]
  enable_nat          = false
}

sg = {
  control_plane_sg_name        = "control-plane-sg"
  control_plane_sg_description = "Security group for the control plane"
  node_group_sg_name           = "node-group-sg"
  node_group_sg_description    = "Security group for the node group"
  bastion_sg_name              = "bastion-sg"
  bastion_sg_description       = "Security group for the bastion host"
  alb_sg_name                  = "alb-sg"
  alb_sg_description           = "Security group for the Application Load Balancer"
}