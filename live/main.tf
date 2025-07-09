module "eks-vpc" {
    source = "../modules/vpc"
    environment = var.common_vars["environment"]
    project=var.common_vars["project_name"]
    common_tags = var.common_vars["common_tags"]
    vpc_cidr = var.vpc["vpc_cidr"]
    public_subnet_cidr = var.vpc["public_subnet_cidr"]
    azs = var.vpc["azs"]
    private_subnet_cidr = var.vpc["private_subnet_cidr"]
    db_subnet_cidr = var.vpc["db_subnet_cidr"]
    enable_nat = var.vpc["enable_nat"]
}