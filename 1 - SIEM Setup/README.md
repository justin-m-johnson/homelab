# Notes
Plan is to "Hybridize" the homelab into Oracle (Tailscale/VPN) to a kubernetes cluster in Oracle running on ARM.

## What is this?
This will set up the basic infrastructure for the ELK Stack and Wazuh

# To-do:
clone_cloud_init_images folder needs to be finished. Goal is to have Proxmox clone the cloud-init image, 
change the VM to have 100GB Drive, 16GB ram, 2 Cores, and appropriate network settings/hostname/etc.
Add Wazuh Docker Container

# Installation Instructions
- Clone this repository
- CD (change directory) into 1 - SIEM Setup/Infrastructure
- Change your hosts file (Infrastructure/hosts) and any other variables within the document
then:
```bash
ansible-playbook -i hosts build.yml -u <<user>> -K
``'