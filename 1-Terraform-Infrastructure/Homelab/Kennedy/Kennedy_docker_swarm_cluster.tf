# Proxmox Full-Clone for Ubuntu VM's (Ubuntu 22.04 cloud-init)
# ---
# This will create a new Virtual Machine from a cloud-init file

resource "proxmox_vm_qemu" "discovery_swarm_node" {
    
    #Set this number to how many VM's you need to deploy, comment out if you don't need to deploy more than 1 (adjust "vmid" and "name" as needed)
    # count = 2
    # List our target node (this is the node ID of our "cluster")
    # vmid is the virtual machine ID in Proxmox, default starts at 100 and counts up
    # name is the name we will identify our virtual machine as
    # desc is a descriptive name for our virtual machine
    target_node = "discovery"
    vmid = "100"
    name = "node1.home.initcyber.net"
    desc = "docker swarm"

    # Set VM to start on boot (true/false)
    onboot = true 

    # We are cloning this template identified here - This is a variable identified in credentials.auto.tfvars
    clone = var.ubuntu_24_template

    # Set to 1 to enable the QEMU Guest Agent.
    agent = 1
    
    # VM CPU settings - self explanatory
    cores = 2
    sockets = 1
    cpu = "host"  

    # VM Hard Drive settings
    scsihw = "virtio-scsi-pci"  # default virtio-scsi-pci
    disks {
        scsi{
            scsi0 {
                disk {
                    storage = "VM_Storage"
                    size = "50G"
                }
            }
        }
        ide{
            ide1{
                cloudinit{
                    storage = "VM_Storage"
                }
            }
        }
    }
      
    
    # VM Memory Settings - Again, self explantory
    memory = 4098
    automatic_reboot = false  # refuse auto-reboot when changing a setting

    # VM Network Settings - Same
    network {
        bridge = "vmbr0"
        model  = "virtio"
        tag = 10
    }

    # Default to cloud-init
    os_type = "cloud-init"

    # IP Address and Gateway - Again, we are using the count.index variable here, assuming we are NOT going above 10 virtual machines this should be OK.
    ipconfig0 = "ip=172.16.10.30/24,gw=172.16.10.1"
    
    # Set user name here
     ciuser = var.user
     cipassword = var.ci_password
    # ---
    # Set SSH keys here
     sshkeys = var.ssh_key
###########Start Ansible Provisioner########################
    connection {
        host = "172.16.10.30"
        user = var.user
        private_key = file(var.ssh_keys["priv"])
        agent = false
        timeout = "3m"
    } 
    provisioner "remote-exec" {
        inline = ["echo 'Starting Ansible Playbooks'"]

    }
    provisioner "local-exec" {
        working_dir = "../../2-Ansible-Provision/MOTD/"
        command = "ansible-playbook -u ${var.user} --key-file ${var.ssh_keys["priv"]} -i 172.16.10.30, MOTD.yml --ssh-common-args='-o StrictHostKeyChecking=no'"
    }
    provisioner "local-exec" {
        working_dir = "../../2-Ansible-Provision/set-time-zone/"
        command = "ansible-playbook -u ${var.user} --key-file ${var.ssh_keys["priv"]} -i 172.16.10.30, set-time-zone.yml --ssh-common-args='-o StrictHostKeyChecking=no'"

    }  
    provisioner "local-exec" {
        working_dir = "../../2-Ansible-Provision/bash-shell/"
        command = "ansible-playbook -u ${var.user} --key-file ${var.ssh_keys["priv"]} -i 172.16.10.30, bash-shell.yml --ssh-common-args='-o StrictHostKeyChecking=no'"
    }    
    provisioner "local-exec" {
        working_dir = "../../2-Ansible-Provision/Docker-Install/"
        command = "ansible-playbook -u ${var.user} --key-file ${var.ssh_keys["priv"]} -i 172.16.10.30, Docker-Portainer-Install.yml --ssh-common-args='-o StrictHostKeyChecking=no'"
    }   
    provisioner "local-exec" {
        working_dir = "../../2-Ansible-Provision/Docker-Install/"
        command = "ansible-playbook -u ${var.user} --key-file ${var.ssh_keys["priv"]} -i 172.16.10.30, Docker-Portainer-Install.yml --ssh-common-args='-o StrictHostKeyChecking=no'"
    }     
}

resource "proxmox_vm_qemu" "atlantis_swarm_node" {
    
    #Set this number to how many VM's you need to deploy, comment out if you don't need to deploy more than 1 (adjust "vmid" and "name" as needed)
    # count = 2
    # List our target node (this is the node ID of our "cluster")
    # vmid is the virtual machine ID in Proxmox, default starts at 100 and counts up
    # name is the name we will identify our virtual machine as
    # desc is a descriptive name for our virtual machine
    target_node = "atlantis"
    vmid = "101"
    name = "node2.home.initcyber.net"
    desc = "docker swarm"

    # Set VM to start on boot (true/false)
    onboot = true 

    # We are cloning this template identified here - This is a variable identified in credentials.auto.tfvars
    clone = var.ubuntu_24_template

    # Set to 1 to enable the QEMU Guest Agent.
    agent = 1
    
    # VM CPU settings - self explanatory
    cores = 2
    sockets = 1
    cpu = "host"  

    # VM Hard Drive settings
    scsihw = "virtio-scsi-pci"  # default virtio-scsi-pci
    disks {
        scsi{
            scsi0 {
                disk {
                    storage = "VM_Storage"
                    size = "50G"
                }
            }
        }
        ide{
            ide1{
                cloudinit{
                    storage = "VM_Storage"
                }
            }
        }
    }
      
    
    # VM Memory Settings - Again, self explantory
    memory = 4098
    automatic_reboot = false  # refuse auto-reboot when changing a setting

    # VM Network Settings - Same
    network {
        bridge = "vmbr0"
        model  = "virtio"
        tag = 10
    }

    # Default to cloud-init
    os_type = "cloud-init"

    # IP Address and Gateway - Again, we are using the count.index variable here, assuming we are NOT going above 10 virtual machines this should be OK.
    ipconfig0 = "ip=172.16.10.31/24,gw=172.16.10.1"
    
    # Set user name here
     ciuser = var.user
     cipassword = var.ci_password
    # ---
    # Set SSH keys here
     sshkeys = var.ssh_key
###########Start Ansible Provisioner########################
    connection {
        host = "172.16.10.31"
        user = var.user
        private_key = file(var.ssh_keys["priv"])
        agent = false
        timeout = "3m"
    } 
    provisioner "remote-exec" {
        inline = ["echo 'Starting Ansible Playbooks'"]

    }
    provisioner "local-exec" {
        working_dir = "../../2-Ansible-Provision/MOTD/"
        command = "ansible-playbook -u ${var.user} --key-file ${var.ssh_keys["priv"]} -i 172.16.10.31, MOTD.yml --ssh-common-args='-o StrictHostKeyChecking=no'"
    }
    provisioner "local-exec" {
        working_dir = "../../2-Ansible-Provision/set-time-zone/"
        command = "ansible-playbook -u ${var.user} --key-file ${var.ssh_keys["priv"]} -i 172.16.10.31, set-time-zone.yml --ssh-common-args='-o StrictHostKeyChecking=no'"

    }  
    provisioner "local-exec" {
        working_dir = "../../2-Ansible-Provision/bash-shell/"
        command = "ansible-playbook -u ${var.user} --key-file ${var.ssh_keys["priv"]} -i 172.16.10.31, bash-shell.yml --ssh-common-args='-o StrictHostKeyChecking=no'"
    }   
    provisioner "local-exec" {
        working_dir = "../../2-Ansible-Provision/Docker-Install/"
        command = "ansible-playbook -u ${var.user} --key-file ${var.ssh_keys["priv"]} -i 172.16.10.31, Docker-Portainer-Install.yml --ssh-common-args='-o StrictHostKeyChecking=no'"
    }  

}

resource "proxmox_vm_qemu" "endeavour_swarm_node" {
    
    #Set this number to how many VM's you need to deploy, comment out if you don't need to deploy more than 1 (adjust "vmid" and "name" as needed)
    # count = 2
    # List our target node (this is the node ID of our "cluster")
    # vmid is the virtual machine ID in Proxmox, default starts at 100 and counts up
    # name is the name we will identify our virtual machine as
    # desc is a descriptive name for our virtual machine
    target_node = "endeavour"
    vmid = "102"
    name = "node3.home.initcyber.net"
    desc = "docker swarm"

    # Set VM to start on boot (true/false)
    onboot = true 

    # We are cloning this template identified here - This is a variable identified in credentials.auto.tfvars
    clone = var.ubuntu_24_template

    # Set to 1 to enable the QEMU Guest Agent.
    agent = 1
    
    # VM CPU settings - self explanatory
    cores = 2
    sockets = 1
    cpu = "host"  

    # VM Hard Drive settings
    scsihw = "virtio-scsi-pci"  # default virtio-scsi-pci
    disks {
        scsi{
            scsi0 {
                disk {
                    storage = "VM_Storage"
                    size = "50G"
                }
            }
        }
        ide{
            ide1{
                cloudinit{
                    storage = "VM_Storage"
                }
            }
        }
    }
      
    
    # VM Memory Settings - Again, self explantory
    memory = 4098
    automatic_reboot = false  # refuse auto-reboot when changing a setting

    # VM Network Settings - Same
    network {
        bridge = "vmbr0"
        model  = "virtio"
        tag = 10
    }

    # Default to cloud-init
    os_type = "cloud-init"

    ipconfig0 = "ip=172.16.10.32/24,gw=172.16.10.1"
    
    # Set user name here
     ciuser = var.user
     cipassword = var.ci_password
    # ---
    # Set SSH keys here
     sshkeys = var.ssh_key
###########Start Ansible Provisioner########################
    connection {
        host = "172.16.10.32"
        user = var.user
        private_key = file(var.ssh_keys["priv"])
        agent = false
        timeout = "3m"
    } 
    provisioner "remote-exec" {
        inline = ["echo 'Starting Ansible Playbooks'"]

    }
    provisioner "local-exec" {
        working_dir = "../../2-Ansible-Provision/MOTD/"
        command = "ansible-playbook -u ${var.user} --key-file ${var.ssh_keys["priv"]} -i 172.16.10.32, MOTD.yml --ssh-common-args='-o StrictHostKeyChecking=no'"
    }
    provisioner "local-exec" {
        working_dir = "../../2-Ansible-Provision/set-time-zone/"
        command = "ansible-playbook -u ${var.user} --key-file ${var.ssh_keys["priv"]} -i 172.16.10.32, set-time-zone.yml --ssh-common-args='-o StrictHostKeyChecking=no'"

    }  
    provisioner "local-exec" {
        working_dir = "../../2-Ansible-Provision/bash-shell/"
        command = "ansible-playbook -u ${var.user} --key-file ${var.ssh_keys["priv"]} -i 172.16.10.32, bash-shell.yml --ssh-common-args='-o StrictHostKeyChecking=no'"
    } 
    provisioner "local-exec" {
        working_dir = "../../2-Ansible-Provision/Docker-Install/"
        command = "ansible-playbook -u ${var.user} --key-file ${var.ssh_keys["priv"]} -i 172.16.10.32, Docker-Portainer-Install.yml --ssh-common-args='-o StrictHostKeyChecking=no'"
    }  
}
