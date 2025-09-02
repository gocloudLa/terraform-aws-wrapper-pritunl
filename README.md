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
| [terraform-aws-modules/ec2-instance/aws](https://github.com/terraform-aws-modules/ec2-instance-aws) | 6.0.2 |
| [terraform-aws-modules/security-group/aws](https://github.com/terraform-aws-modules/security-group-aws) | 5.3.0 |



## 🚀 Quick Start
```hcl
pritunl_parameters = {
    enable       = true
    # create_route53_records = false # Default: true
    domain       = "${local.zone_public}"
    aws_ami_name = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20221212"
    # vpc_name = "" # (Optional) Default: ${local.common_name} / Example: dmc-prd
    # subnet_name = "" # (Optional) Default: ${local.common_name}-public* / Example: dmc-prd-public*
    # vpc_id = "" # (Optional) Default: null
    # subnet_id = "" # (Optional) Default: null
  }

  pritunl_defaults = var.pritunl_defaults
```


## 🔧 Additional Features Usage









## ⚠️ Important Notes
### Initial Configuration
```
1 - Login to server via SSM

2 - Check logs and wait for installation to complete ( tail -f /var/log/syslog )

3 - Restart pritunl service "systemctl restart pritunl" (root)

4 - Generate administrator key "pritunl default-password" (root)

5 - Navigate web interface via HTTPS (custom domain / public IP) ( takes a few minutes )

6 - "Initial Setup" ( Web Interface )
  * New Password = Specify new password
  * Public Address = Complete with Public Domain or IP
  * Lets Encrypt Domain = In case of having a public domain, indicate it

7 - Server Configuration ( Web Interface )
  * Users > Add Organization
    Name : "{key.company}-{key.env}" # Example: dmc-dev / gcl-stg / etc

  * Servers > Add Server ( Click on Advanced )
    Name : "{key.company}-{key.env}" # Example: dmc-dev / gcl-stg / etc
    DNS Server : VPC DNS, Always the second IP of the VPC (Example vpc_cidr = 10.100.0.0/16, DNS Server = 10.100.0.2)
    Enable DNS Routing: Check
    Allow Multiple Devices: Check
    Inter-Client Routing: NO Check

  * Delete Route "0.0.0.0/0" (We avoid sending ALL traffic through the VPN)

  * Add Route
    * Network: VPC_CIDR ( Example 10.100.0.0/16 )

  * Servers > Attach Organization
    Leave options as Default

  * Servers > Start Server

  * Users > Add User
    Name: Format {FirstName}.{LastName}name
    Pin: Optional, if you want to request a numeric pin from the user
```



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