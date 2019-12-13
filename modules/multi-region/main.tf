# --------------------------------------------------------------------------------------------------
# Clears rules associated with default resources.
# --------------------------------------------------------------------------------------------------

resource "aws_default_vpc" "default" {
  count = var.enabled ? 1 : 0

  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_route_table" "default" {
  count = var.enabled ? 1 : 0

  default_route_table_id = aws_default_vpc.default[0].default_route_table_id

  tags = {
    Name = "Default Route Table"
  }
}

// Ignore "subnet_ids" changes to avoid the known issue below.
// https://github.com/hashicorp/terraform/issues/9824
// https://github.com/terraform-providers/terraform-provider-aws/issues/346
resource "aws_default_network_acl" "default" {
  count = var.enabled ? 1 : 0

  default_network_acl_id = aws_default_vpc.default[0].default_network_acl_id

  tags = {
    Name = "Default Network ACL"
  }

  lifecycle {
    ignore_changes = [subnet_ids]
  }
}

resource "aws_default_security_group" "default" {
  count = var.enabled ? 1 : 0

  vpc_id = aws_default_vpc.default[0].id

  tags = {
    Name = "Default Security Group"
  }
}


output "default_vpc" {
  description = "The default VPC."
  value       = var.enabled ? aws_default_vpc.default[0] : null
}

output "default_security_group" {
  description = "The default security group."
  value       = var.enabled ? aws_default_security_group.default[0] : null
}

output "default_network_acl" {
  description = "The default network ACL."
  value       = var.enabled ? aws_default_network_acl.default[0] : null
}

output "default_route_table" {
  description = "The default route table."
  value       = var.enabled ? aws_default_route_table.default[0] : null
}


