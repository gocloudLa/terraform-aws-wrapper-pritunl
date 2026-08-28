locals {
  default_ingress_with_cidr_blocks = [
    {
      rule        = "http-80-tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Enable all access"
    },
    {
      rule        = "https-443-tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Enable all access"
    },
    {
      from_port   = 10000
      to_port     = 16999
      protocol    = "udp"
      description = "Pritunl"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  ingress_with_cidr_blocks = coalesce(var.ingress_with_cidr_blocks, local.default_ingress_with_cidr_blocks)

  user_data_domain = var.domain != "" ? try(aws_route53_record.this[0].fqdn, "") : try(aws_eip.this[0].public_ip, "127.0.0.1")
  user_data = templatefile("${path.module}/template/user_data.tpl",
  { domain = "${local.user_data_domain}" })

}