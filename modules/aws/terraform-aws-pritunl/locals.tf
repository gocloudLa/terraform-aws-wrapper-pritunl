locals {

  user_data_domain = var.domain != "" ? try(aws_route53_record.this[0].fqdn, "") : try(aws_eip.this[0].public_ip, "127.0.0.1")
  user_data = templatefile("${path.module}/template/user_data.tpl",
  { domain = "${local.user_data_domain}" })

}