# Home Lab SOC (Security Operations Center)
Welcome to my Home Lab SOC documentation where I plan on documenting how I set up my Home Lab as a mock Security Operations Center/Threat Detection/Blue Team lab and my journey in using free and open-source software. This documentation will also be posted on [my personal website](https://www.initcyber.com) and I may also do a [YouTube](https://www.youtube.com/@initcyber) video or two.

I plan on updating this document frequently. At the time of this commit, I'm starting off small with a basic SIEM tool (ELK Stack) coupled with ElasticSearch's EDR tool. This not only will provide the Dashboard, but also provide Endpoint Detection and Response. I am hoping to build this project out and find tools such as an Alert Management System, Automated Compliance Testing, Automated Vulnerability Scanning (and Management), Threat Intelligence Tools, Incident Response Tools, and more. Obviously, I am omitting a ton of other Cybersecurity "Tools" which I did not list (such as Firewalls, Password Management, IAM Tools, etc.) however, they are not listed due to either being

A) Already Implemented at a higher level in the lab 

or

B) I could really dig completely deep and at some point, I would be at enterprise level needing a full team to monitor, or I would just air-gap everything and be done.

## Use Case

The use case for this documentation/project is to help people who want to be in Cybersecurity learn how to break into Cybersecurity. There are several avenues in which a person could perform a *Cybersecurity Role* (such as DevSecOps, SOC, GRC, Security Engineer, IT Security Specialists, etc.) and none of them are wrong, but from my experience, if you do not have a Home Lab and a Project to show case, your chances of **Breaking into Cybersecurity** are very slim. I hope this project will inspire those who want to break into the field, and be able to showcase what they learn.

## "How do I use (something like) this for a Cybersecurity Career?"
Most resumes have a "Project" section. Don't post my project on there (don't even fork it to your repository and post it, it won't work). Create your own GitHub, website, etc., and showcase your project on your resume under "Current Projects".  You can even post you project on [LinkedIn](https://www.linkedin.com/in/imjustinjohnson/).

## Hardware Used
For my HomeLab I am using:

 - Two similarly spec'd Dell 5050 Small Form Factor Computers
	 - i7-7700 Intel CPU
	 - 64GB Ram
	 - Machine 1:
		 - 128GB SSD Boot
		 - 1TB NVMe
	 - Machine 2:
		 - 256GB SSD Boot
		 - 1TB NVMe

## Software Used

 - Hypervisor: [Proxmox](https://www.proxmox.com/en/)
	 - Built in Containerization and KVM/QEMU Support
	 - Hypervisor isn't necessarily important per se for this project, but any future Ansible/Terraform scripts will be tailored towards the Proxmox Hypervisor.
 - SIEM: [ELK Stack:](https://www.elastic.co/elastic-stack)
    - [Elastic Search](https://www.elastic.co/elasticsearch) 	
    - [Kibana](https://www.elastic.co/kibana) 	
    - [Log Stash](https://www.elastic.co/logstash)
  - [Elastic EDR](https://www.elastic.co/endpoint-detection-response)
  - More TBD

## Architecture Diagram

Coming Soon



# Implementation

Coming Soon

## Virtual Machine Requirements

Coming Soon



# Putting it all together

Coming Soon

## TBD

TBD

