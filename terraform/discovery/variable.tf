# Proxmox Provider
# ---
# Initial Provider Configuration for Proxmox

terraform {

    required_version = ">= 0.13.0"

    required_providers {
        proxmox = {
            source = "telmate/proxmox"
            version = "3.0.1-rc4" # Latest as of 7/4/2024
        }
    }
}

# Variables below defined in credential.auto.tfvars
variable "proxmox_api_url" {
    type = string
}

variable "proxmox_api_token_id" {
    type = string
}

variable "proxmox_api_token_secret" {
    type = string
}
# variable "proxmox_api_url_kennedy" {
#     type = string
# }

# variable "proxmox_api_token_id_kennedy" {
#     type = string
# }

# variable "proxmox_api_token_secret_kennedy" {
#     type = string
# }
# variable "proxmox_api_url_enterprise" {
#     type = string
# }

# variable "proxmox_api_token_id_enterprise" {
#     type = string
# }

# variable "proxmox_api_token_secret_enterprise" {
#     type = string

# }
variable "ssh_key" {
    type = string
}
variable "ci_user" {
    type = string
}
variable "ci_password" {
    type = string
}

variable "ubuntu_24_template" {
    type = string
}

variable "rhel_9_template" {
    type = string
}

variable "ssh_keys" {
	type = map
     default = {
       pub  = "~/.ssh/id_rsa.pub"
       priv = "~/.ssh/id_rsa"
     }
}
variable "user" {
	default     = "justin"
	description = "User used to SSH into the machine and provision it"
}
provider "proxmox" {
    # alias = "kennedy"
    pm_api_url = var.proxmox_api_url
    pm_api_token_id = var.proxmox_api_token_id
    pm_api_token_secret = var.proxmox_api_token_secret

    # (Optional) Skip TLS Verification - uncomment for self signed certs
    # pm_tls_insecure = true

}
# provider "proxmox" {
#     alias = "enterprise"
#     pm_api_url = var.proxmox_api_url_enterprise
#     pm_api_token_id = var.proxmox_api_token_id_enterprise
#     pm_api_token_secret = var.proxmox_api_token_secret_enterprise

#     # (Optional) Skip TLS Verification - uncomment for self signed certs
#     # pm_tls_insecure = true

# }