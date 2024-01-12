# Notes
Plan is to "Hybridize" the homelab into Oracle (Tailscale/VPN) to a kubernetes cluster in Oracle running on ARM.

## What is this?
This will set up the basic infrastructure for Trivy, pytest, semgrep, and falco.

# To-do:
clone_cloud_init_images folder needs to be finished. Goal is to have Proxmox clone the cloud-init image, 
change the VM to have 100GB Drive, 8GB ram, 2 Cores, and appropriate network settings/hostname/etc.


# VM Requirements:
Memory: 8 GB
CPU: 2 Cores
HDD/SSD: 100GB (can scale up or down, wouldn't go below 50GB)

# Installation Instructions
- Clone this repository 
- CD (change directory) into 2 - Continuous Integration
- Change your hosts file (Infrastructure/hosts) and any other variables within the document
then:
```bash
ansible-playbook -i hosts build.yml -u <<user>> -K
```
then you must manually log into the VM and running
```bash
semgrep login
```
In order to log in via web.