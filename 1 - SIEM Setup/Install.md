# SIEM Setup
*** Eventually want to use Ansible to script this out, want to get proof of concept first ***

Installation Instructions to set up the SIEM - Elastic Search, Kibana, and Logstash.

A single node k3s instance for this lab is used, on a VM with the following specs:

 - Ubuntu 22.04.x LTS
	 - 4 vCPU
	 - 16GB Ram
	 - 100 GB SSD

## k3s Setup

After setting up your virtual machine, run your usual 
```bash
$ sudo apt update && sudo apt upgrade
```

then install k3s

```bash
$ curl -sfL https://get.k3s.io | sh -
```

double check that k3s is working and get cluster/node info

```bash
$ sudo systemctl status k3s.service
$ sudo kubectl cluster-info
$ sudo kubectl get node
```

remember to open up port 6443. for UFW enabled servers the command is:

```bash
$ sudo ufw allow 6443/tcp
$ sudo ufw reload
```
## Setting up the Kubectl machine
The machine that interacts with your k3s "cluster" needs kubectl installed in order to send commands.

I'm using Windows Subsystem for Linux, it works just as well. (mines an Ubuntu Linux machine as well, you could use any distro of your choice)

(following this guide: https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

Install kubectl 

```bash
$ sudo apt-get update
```

```bash
$ curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
```
```bash
$ echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
```
then install it:
```bash
sudo apt-get update
sudo apt-get install -y kubectl
```
finally get the contents of your k3s.yaml file (back to your server)
```bash
$ sudo cat /etc/rancher/k3s/k3s.yaml
```
copy this content into a new file created on your kubectl machine
```bash
$ nano ~/.kube/config
```
*paste the contents* 

I use nano and I like it...

While still inside of the config file, replace 127.0.0.1 next to "server" with the server ip

then set permissions correctly for the file to protect it
```bash
$ chown $(id -u):$(id -g) ~/.kube/config
$ chmod 600 ~/.kube/config
```

Test your kubectl
```bash
$ kubectl cluster-info
```
and you should get info about your cluster.

## Installing (Helm/ELK?)
Coming soon