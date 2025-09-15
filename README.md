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
| <a href="https://github.com/terraform-aws-modules/terraform-aws-ec2-instance" target="_blank">terraform-aws-modules/ec2-instance/aws</a> | 6.1.1 |
| <a href="https://github.com/terraform-aws-modules/terraform-aws-security-group" target="_blank">terraform-aws-modules/security-group/aws</a> | 5.3.0 |



## 🚀 Quick Start
```hcl
pritunl_parameters = {
  enable = true
  domain = "${local.zone_public}"
  vpc_name = "vpcname"
  aws_ami_name = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
  create_route53_records = false
}
```


## 🔧 Additional Features Usage



## 📑 Inputs
| Name                   | Description                                                         | Type     | Default                                                       | Required |
| ---------------------- | ------------------------------------------------------------------- | -------- | ------------------------------------------------------------- | -------- |
| enable                 | Whether to create the Pritunl VPN instance                          | `bool`   | `false`                                                       | no       |
| vpc_id                 | The ID of the VPC where the Pritunl instance will be deployed       | `string` | `null`                                                        | no       |
| subnet_id              | The ID of the subnet where the Pritunl instance will be deployed    | `string` | `null`                                                        | no       |
| aws_ami_name           | The Amazon Machine Image (AMI) name to use for the Pritunl instance | `string` | `ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*` | no       |
| vpc_name               | The Name of the VPC where the Pritunl instance will be deployed     | `string` | `null`                                                        | no       |
| subnet_name            | The Name of the Subnet where the Pritunl instance will be deployed  | `string` | `null`                                                        | no       |
| domain                 | The domain name to associate with the Pritunl instance              | `string` | `""`                                                          | no       |
| create_route53_records | Whether to create Route53 DNS records for the domain                | `bool`   | `true`                                                        | no       |
| tags                   | A map of tags to assign to resources.                               | `map`    | `{}`                                                          | no       |







## ⚠️ Important Notes
- **⚠️ Instance Creation:** Set `enable = true` to create the Pritunl VPN instance
- **⚠️ Domain Configuration:** Provide `domain` to create Route53 DNS records automatically
- **⚠️ AMI Selection:** Uses Ubuntu 24.04 LTS by default, ensure AMI is available in your region
- **⚠️ Network Configuration:** Instance deploys in public subnet with security group access

## Initial Configuration Steps

After the Terraform deployment completes, follow these steps to configure Pritunl:

**1. Server Access:**
- Login to server via SSM

**2. Installation Verification:**
- Check logs and wait for installation to complete: `tail -f /var/log/syslog`

**3. Service Configuration:**
- Restart pritunl service: `systemctl restart pritunl` (root)
- Generate administrator key: `pritunl default-password` (root)

**4. Web Interface Access:**
- Navigate to web interface via HTTPS (custom domain / public IP) - takes a few minutes

**5. Initial Setup (Web Interface):**
- New Password = Specify new password
- Public Address = Complete with Public Domain or IP
- Lets Encrypt Domain = In case of having a public domain, indicate it

**6. Server Configuration (Web Interface):**
- Users > Add Organization
  * Name: `{key.company}-{key.env}` # Example: dmc-dev / gcl-stg / etc

- Servers > Add Server (Click on Advanced)
  * Name: `{key.company}-{key.env}` # Example: dmc-dev / gcl-stg / etc
  * DNS Server: VPC DNS, Always the second IP of the VPC (Example vpc_cidr = 10.100.0.0/16, DNS Server = 10.100.0.2)
  * Enable DNS Routing: Check
  * Allow Multiple Devices: Check
  * Inter-Client Routing: NO Check

**7. Network Configuration:**
- Delete Route "0.0.0.0/0" (We avoid sending ALL traffic through the VPN)
- Add Route
  * Network: VPC_CIDR (Example 10.100.0.0/16)

**8. Organization and Server Setup:**
- Servers > Attach Organization
  * Leave options as Default

- Servers > Start Server

**9. User Management:**
- Users > Add User
  * Name: Format `{FirstName}.{LastName}`
  * Pin: Optional, if you want to request a numeric pin from the user



---

## 🤝 Contributing
We welcome contributions! Please see our contributing guidelines for more details.

## 🆘 Support
- 📧 **Email**: info@gocloud.la

## 🧑‍💻 About
We are focused on Cloud Engineering, DevOps, and Infrastructure as Code.
We specialize in helping companies design, implement, and operate secure and scalable cloud-native platforms.
- 🌎 [www.gocloud.la](https://www.gocloud.la)
- ☁️ AWS Advanced Partner (Terraform, DevOps, GenAI)
- 📫 Contact: info@gocloud.la

## 📄 License
This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details. 