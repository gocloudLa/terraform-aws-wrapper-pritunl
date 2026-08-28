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
    # ingress_with_cidr_blocks = [
    #   {
    #     rule        = "http-80-tcp"
    #     cidr_blocks = "0.0.0.0/0"
    #     description = "Enable all access"
    #   },
    #   {
    #     rule        = "https-443-tcp"
    #     cidr_blocks = "0.0.0.0/0"
    #     description = "Enable all access"
    #   },
    #   {
    #     from_port   = 10000
    #     to_port     = 16999
    #     protocol    = "udp"
    #     description = "Pritunl"
    #     cidr_blocks = "0.0.0.0/0"
    #   }
    # ]
  }

  pritunl_defaults = var.pritunl_defaults
}