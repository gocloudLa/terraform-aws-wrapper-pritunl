module "wrapper_pritunl" {
  source = "../../"

  metadata = local.metadata

  pritunl_parameters = {
    enable                 = true
    create_route53_records = true # Default: true
    domain                 = "${local.zone_public}"

    # aws_ami_name = "" # (Optional) Default: "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
    # vpc_name     = "" # (Optional) Default: ${local.common_name} / Example: dmc-prd
    # subnet_name  = "" # (Optional) Default: ${local.common_name}-public* / Example: dmc-prd-public*
    # vpc_id       = "" # (Optional) Default: null
    # subnet_id    = "" # (Optional) Default: null
  }

  pritunl_defaults = var.pritunl_defaults
}