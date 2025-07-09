module "control_plane" {
    source = "../modules/sg"
    environment         = var.common_vars["environment"]
    project             = var.common_vars["project_name"]
    common_tags         = var.common_vars["common_tags"]
    sg_name             = var.sg["control_plane_sg_name"]
    sg_description      = var.sg["control_plane_sg_description"]
}
module "node_group" {
    source = "../modules/sg"
    environment         = var.common_vars["environment"]
    project             = var.common_vars["project_name"]
    common_tags         = var.common_vars["common_tags"]
    sg_name             = var.sg["node_group_sg_name"]
    sg_description      = var.sg["node_group_sg_description"]
}
module "bastion" {
    source = "../modules/sg"
    environment         = var.common_vars["environment"]
    project             = var.common_vars["project_name"]
    common_tags         = var.common_vars["common_tags"]
    sg_name             = var.sg["bastion_sg_name"]
    sg_description      = var.sg["bastion_sg_description"]
}
module "alb_sg" {
    source = "../modules/sg"
    environment         = var.common_vars["environment"]
    project             = var.common_vars["project_name"]
    common_tags         = var.common_vars["common_tags"]
    sg_name             = var.sg["alb_sg_name"]
    sg_description      = var.sg["alb_sg_description"]
}

resource "aws_security_group_rule" "internet_controlplane" {
  description = "Allow HTTPS inbound traffic from the internet to the control plane"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.control_plane.sg_id
}

resource "aws_security_group_rule" "controlplane_nodegroup" {
    description = "Allow traffic from control plane to node group"
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "tcp"
  source_security_group_id = module.control_plane.sg_id
  security_group_id = module.node_group.sg_id
}
resource "aws_security_group_rule" "nodegroup_controlplane" {
    description = "Allow traffic from node group to control plane"
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "tcp"
  source_security_group_id = module.node_group.sg_id
  security_group_id = module.control_plane.sg_id
}

resource "aws_security_group_rule" "nodegroup_itself" {
    description = "Allow traffic from node group to itself"
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "tcp"
  source_security_group_id = module.node_group.sg_id
  security_group_id = module.node_group.sg_id
}