data "aws_caller_identity" "current" {}

/*----------------------------------------------------------------------*/
/* NetWorking | datasources                                             */
/*----------------------------------------------------------------------*/
data "aws_vpc" "this" {
  count = try(var.pritunl_parameters.enable, false) ? 1 : 0

  filter {
    name = "tag:Name"
    values = [
      try(var.pritunl_parameters.vpc_name, "${local.default_vpc_name}")
    ]
  }
}

data "aws_subnets" "this" {
  count = try(var.pritunl_parameters.enable, false) ? 1 : 0

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this[0].id]
  }

  tags = {
    Name = try(var.pritunl_parameters.subnet_name, "${local.default_subnet_public_name}")
  }
}