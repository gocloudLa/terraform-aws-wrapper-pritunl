data "aws_ami" "this" {
  count       = var.create ? 1 : 0
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = [var.aws_ami_name]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_vpc" "this" {
  count = var.create ? 1 : 0
  id    = var.vpc_id
}

data "aws_route53_zone" "this" {
  count        = (var.create && var.create_route53_records && (var.domain != "")) ? 1 : 0
  name         = var.domain
  private_zone = false
}
