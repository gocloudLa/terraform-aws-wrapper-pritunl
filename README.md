# Standard Platform - Terraform Module 🚀🚀
<p align="right"><a href="https://partners.amazonaws.com/partners/0018a00001hHve4AAC/GoCloud"><img src="https://img.shields.io/badge/AWS%20Partner-Advanced-orange?style=for-the-badge&logo=amazonaws&logoColor=white" alt="AWS Partner"/></a><a href="LICENSE"><img src="https://img.shields.io/badge/License-Apache%202.0-green?style=for-the-badge&logo=apache&logoColor=white" alt="LICENSE"/></a></p>

Welcome to the Standard Platform — a suite of reusable and production-ready Terraform modules purpose-built for AWS environments.
Each module encapsulates best practices, security configurations, and sensible defaults to simplify and standardize infrastructure provisioning across projects.

## 📦 Module: Terraform VPN Access Module
<p align="right"><a href="https://github.com/gocloudLa/terraform-aws-wrapper-pritunl/releases/latest"><img src="https://img.shields.io/github/v/release/gocloudLa/terraform-aws-wrapper-pritunl.svg?style=for-the-badge" alt="Latest Release"/></a><a href=""><img src="https://img.shields.io/github/last-commit/gocloudLa/terraform-aws-wrapper-pritunl.svg?style=for-the-badge" alt="Last Commit"/></a><a href="https://registry.terraform.io/modules/gocloudLa/wrapper-pritunl/aws"><img src="https://img.shields.io/badge/Terraform-Registry-7B42BC?style=for-the-badge&logo=terraform&logoColor=white" alt="Terraform Registry"/></a></p>
This folder contains the necessary resources to manage secure access to the infrastructure. It is a VPN solution that allows the management of secure connections through private networks.

### ✨ Features



### 🔗 External Modules
| Name | Version |
|------|------:|
| <a href="https://github.com/terraform-aws-modules/terraform-aws-ec2-instance" target="_blank">terraform-aws-modules/ec2-instance/aws</a> | 6.0.2 |
| <a href="https://github.com/terraform-aws-modules/terraform-aws-security-group" target="_blank">terraform-aws-modules/security-group/aws</a> | 5.3.0 |



## 🚀 Quick Start
```hcl
pritunl_parameters = {
  enable = true
  domain = "${local.zone_public}"
  aws_ami_name = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
  create_route53_records = true
}

pritunl_defaults = var.pritunl_defaults
```


## 🔧 Additional Features Usage



## 📑 Inputs
| Name                   | Description                                                         | Type     | Default                                                       | Required |
| ---------------------- | ------------------------------------------------------------------- | -------- | ------------------------------------------------------------- | -------- |
| enable                 | Whether to create the Pritunl VPN instance                          | `bool`   | `false`                                                       | no       |
| vpc_id                 | The ID of the VPC where the Pritunl instance will be deployed       | `string` | `null`                                                        | no       |
| subnet_id              | The ID of the subnet where the Pritunl instance will be deployed    | `string` | `null`                                                        | no       |
| aws_ami_name           | The Amazon Machine Image (AMI) name to use for the Pritunl instance | `string` | `ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*` | no       |
| domain                 | The domain name to associate with the Pritunl instance              | `string` | `""`                                                          | no       |
| create_route53_records | Whether to create Route53 DNS records for the domain                | `bool`   | `true`                                                        | no       |
| tags                   | Custom tags to assign to resources                                  | `map`    | `null`                                                        | no       |







## ⚠️ Important Notes
- **⚠️ Instance Creation:** Set `enable = true` to create the Pritunl VPN instance
- **⚠️ Domain Configuration:** Provide `domain` to create Route53 DNS records automatically
- **⚠️ AMI Selection:** Uses Ubuntu 24.04 LTS by default, ensure AMI is available in your region
- **⚠️ Network Configuration:** Instance deploys in public subnet with security group access



---

## 🤝 Contributing
We welcome contributions! Please see our contributing guidelines for more details.

## 🆘 Support
- 📧 **Email**: info@gocloud.la
- 🐛 **Issues**: [GitHub Issues](https://github.com/gocloudLa/issues)

## 🧑‍💻 About
We are focused on Cloud Engineering, DevOps, and Infrastructure as Code.
We specialize in helping companies design, implement, and operate secure and scalable cloud-native platforms.
- 🌎 [www.gocloud.la](https://www.gocloud.la)
- ☁️ AWS Advanced Partner (Terraform, DevOps, GenAI)
- 📫 Contact: info@gocloud.la

## 📄 License
This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details. 