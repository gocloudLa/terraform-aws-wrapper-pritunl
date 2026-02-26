module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.2.0"
  count   = var.create ? 1 : 0

  name                   = var.name
  ami                    = data.aws_ami.this[0].id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  create_security_group  = false
  vpc_security_group_ids = [module.security_group[0].security_group_id]

  associate_public_ip_address = true
  disable_api_stop            = false

  ignore_ami_changes = true

  create_iam_instance_profile = true
  iam_role_description        = "IAM role for EC2 instance (${var.name})"
  iam_role_policies = {
    AmazonSSMManagedEC2InstanceDefaultPolicy = "arn:aws:iam::aws:policy/AmazonSSMManagedEC2InstanceDefaultPolicy"
  }

  user_data_base64            = base64encode(local.user_data)
  user_data_replace_on_change = false
  enable_volume_tags          = false
  root_block_device = {
    delete_on_termination = lookup(var.root_block_device, "delete_on_termination", true)
    encrypted             = lookup(var.root_block_device, "encrypted", true)
    iops                  = lookup(var.root_block_device, "iops", null)
    kms_key_id            = lookup(var.root_block_device, "kms_key_id", null)
    size                  = lookup(var.root_block_device, "size", 20)
    type                  = lookup(var.root_block_device, "type", "gp3")
    throughput            = lookup(var.root_block_device, "throughput", null)
  }

  tags = var.tags
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.1"
  count   = var.create ? 1 : 0

  name            = var.name
  description     = "Security group for Pritunl-VPN"
  vpc_id          = var.vpc_id
  use_name_prefix = false

  ingress_with_cidr_blocks = [
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

  egress_rules = ["all-all"]

  tags = var.tags
}

#Create an Elastic IP
resource "aws_eip" "this" {
  count = var.create ? 1 : 0

  domain = "vpc"
}

#Associate EIP with EC2 Instance
resource "aws_eip_association" "this" {
  count = var.create ? 1 : 0

  instance_id   = module.ec2_instance[0].id
  allocation_id = aws_eip.this[0].id
}

resource "aws_route53_record" "this" {
  count   = (var.create && var.create_route53_records && (var.domain != "")) ? 1 : 0
  zone_id = data.aws_route53_zone.this[0].id
  name    = "vpn.${var.domain}"
  ttl     = 60
  type    = "A"
  records = ["${aws_eip.this[0].public_ip}"]
}
