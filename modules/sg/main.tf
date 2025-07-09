locals {
  name = "${var.environment}-${var.project}-${var.sg_name}"
}
resource "aws_security_group" "asg" {
  name        = local.name
  description = var.sg_description
  vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = each.value.from_port
      to_port     = each.value.to_port
      protocol    = each.value.protocol
      cidr_blocks = each.value.cidr_blocks
      description = each.value.description
    }
  }
    dynamic "egress" {
        for_each = var.egress_rules
        content {
        from_port   = each.value.from_port
        to_port     = each.value.to_port
        protocol    = each.value.protocol
        cidr_blocks = each.value.cidr_blocks
        description = each.value.description
        }
    }

  tags = merge({
    Name = local.name
  },
  var.common_tags
  )
}