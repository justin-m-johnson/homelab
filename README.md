#  Project Description
Welcome to my Home Lab DevSecOp/Production documentation where I plan on documenting how I set up my Home Lab as a DevSecOp lab and my journey in using (mostly) free and open-source software. This documentation will also be posted on [my personal website](https://www.initcyber.com) and I may also do a [YouTube](https://www.youtube.com/@initcyber) video or two.


## Use Case
The use case for this documentation/project is to help people who want to be in Cybersecurity learn how to break into Cybersecurity. There are several avenues in which a person could perform a *Cybersecurity Role* (such as DevSecOps, SOC, GRC, Security Engineer, IT Security Specialists, etc.) and none of them are wrong, but from my experience, if you do not have a Home Lab and a Project to show case, your chances of **Breaking into Cybersecurity** are very slim. I hope this project will inspire those who want to break into the field, and be able to showcase what they learn.

## "How do I use (something like) this for a Cybersecurity Career?"
Most resumes have a "Project" section. Create your own GitHub, website, etc., and showcase your project on your resume under "Current Projects".  You can even post you project on [LinkedIn](https://www.linkedin.com/in/imjustinjohnson/).

## Updates
| Date             | Description                                                                          |
| ---------------- | ------------------------------------------------------------------------------------ |
| December 2023    | Initial Project                                                                      |
| January 2024     | Software/Hardware Changes, project rename (Homelab SOC to Homelab DevSecOp)          |
| Mid January 2024 | Added the Actions Workflow yml file that allows uploading Github Actions log to SIEM |
| End January 2024 | Major Overhaul in scripts                                                            |
| Mid June 2024    | Overhaul Homelab - Old Discovery Node removed - Three (3) new nodes added - Added LLM Docker Containers and OpenWebUI    |

## Hardware Used
For my HomeLab I am using:

 - Lenovo m710q Ultra small form Factor Computer x3 (Discovery, Atlantis, Endeavor):
	 - i5-6500T Intel CPU
	 - 8GB RAM (To be upgraded to 64GB)
	 - 1TB NVMe Data 

 - White Box Computer
     - i3 - 9300 Intel CPU
     - 32GB Ram
     - 512GB SSD Boot
     - 256GB SSD Log Storage

## Software Used
| Purpose                           | Software          | Link                                                      |
| --------------------------------- | ----------------- | --------------------------------------------------------- |
| Initial Code Scan                 | pre-commit        | https://pre-commit.com/                                   |
| Hypervisor                        | Proxmox           | https://www.proxmox.com/                                  |
| Containers                        | Docker            | https://www.docker.com                                    |
| Security Platform/Vuln Scanner    | Wazuh             | https://wazuh.com/                                        |
| SCM                               | GitHub            | https://www.github.com                                    |
| Secrets Storage / Cert Management | Hashicorp Vault   | https://hashicorp.com
| Pipeline/automation               | Github Actions    | https://docs.github.com/en/actions                        |
| SIEM/Logging                      | Splunk            | https://www.splunk.com                                    |
| SOAR/Incident Response            | The Hive          | https://thehive-project.com                               |
| Malware Information Sharing/OSINT | MISP              | https://www.misp-project.org/                             |
| SAST                              | Semgrep           | https://www.semgrep.dev                                   |
| DAST                              | OWASP ZAP         | https://www.zaproxy.org/                                  |
| IAST/Runtime                      | Falco             | https://falco.org/                                        |
| Open Source Large Language Model Tool  | Ollama            | https://ollama.com/                                  |
| Web UI for Large Language Models/API's  | OpenWebUI   | https://openwebui.com                                     |

  - More TBD

## Architecture Diagram (Ever Changing)
Last Edit: January 2024
![HomelabDevSecOps](assets/Homelab.png)

# Implementation

0 - Development Environment Files
This  folder has a Development Container which contains the .pre-commmit-config.yaml file. You can read more here: [Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers),  [Pre-Commit](https://pre-commit.com/) In a "Shift-left" mentality you want to ensure that you are providing developers with the tools required to check their code before committing. Some examples of code checking before committing is using tools that will "Lint" your code as well as code scanning (ex. Black for Python, trimming whitepace, secrets scanning, etc.). 

You can use the pre-commit separately without using Dev Containers as well.

1-Ansible-Infrastructure
This folder is used to provision the infrastructure running in my homelab. Change the ansible files as needed.

2-Ansible-Provision
These scripts are used to provision the various VM's created from folder 1 - Ansible-Infrastructure.

3-Docker Containers
These contain the docker-compose.yml scripts for various VM's.

4 - Monitoring-Notifications
TBD

## Virtual Machine Requirements

1 - SIEM VM
 - 2 CPU Cores
 - 16 GB RAM
 - 100 GB SSD

2 - CI VM
 - 2 CPU core
 - 16 GB RAM
 - 50 GB SSD



# Putting it all together

View the readme.md in each subfolder to run the Ansible Playbooks.

# Best Practices
For the initial stages and a "Shift left", start with the Developer(s) to own security for their code from their development workspace. Encourage .gitignore files and using the pre-commit hooks in order to start securing their code from the beginning.

Commit Signing is also encouraged, as well as using SSH to clone/push repo changes. Obviously using different branches to push code into without affecting the Main/Master branch.

A Local Software Composition Analysis and local Static Code Analysis scan (implemented via pre-commit hooks) can be utilized.




# Future Updates


The following is a list of items to be implemented into this project into the future. Items from this list will be brought to the top and as it is implemented. This is more of a "laundry list" of ideas/brain dump.

 - Python Script to take Data from Nessus Essentials (API) to Wazuh and Splunk
 - Automate Compliance through Ansible (CIS benchmarks) and Golden Image

