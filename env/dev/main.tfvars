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