module "pritunl" {
  source = "./modules/aws/terraform-aws-pritunl"

  create = try(var.pritunl_parameters.enable, false)

  name                   = "${local.common_name}-pritunl"
  vpc_id                 = try(var.pritunl_parameters.vpc_id, data.aws_vpc.this[0].id, null)
  subnet_id              = try(var.pritunl_parameters.subnet_id, element(data.aws_subnets.this[0].ids, 0), null)
  aws_ami_name           = try(var.pritunl_parameters.aws_ami_name, "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*")
  domain                 = try(var.pritunl_parameters.domain, "")
  create_route53_records = try(var.pritunl_parameters.create_route53_records, true)

  tags = merge(local.common_tags, try(var.pritunl_parameters.tags, var.pritunl_defaults.tags, null))

}