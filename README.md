#  Project Description
Welcome to my Home Lab SOC documentation where I plan on documenting how I set up my Home Lab as a mock Security Operations Center/Threat Detection/Blue Team lab and my journey in using free and open-source software. This documentation will also be posted on [my personal website](https://www.initcyber.com) and I may also do a [YouTube](https://www.youtube.com/@initcyber) video or two.

I plan on updating this document frequently. At the time of this commit, I'm starting off small with a basic SIEM tool (ELK Stack) coupled with ElasticSearch's EDR tool. This not only will provide the Dashboard, but also provide Endpoint Detection and Response. I am hoping to build this project out and find tools such as an Alert Management System, Automated Compliance Testing, Automated Vulnerability Scanning (and Management), Threat Intelligence Tools, Incident Response Tools, and more. Obviously, I am omitting a ton of other Cybersecurity "Tools" which I did not list (such as Firewalls, Password Management, IAM Tools, etc.) however, they are not listed due to either being

A) Already Implemented at a higher level in the lab 

or

B) I could really dig completely deep and at some point, I would be at enterprise level needing a full team to monitor, or I would just air-gap everything and be done.

## Use Case

The use case for this documentation/project is to help people who want to be in Cybersecurity learn how to break into Cybersecurity. There are several avenues in which a person could perform a *Cybersecurity Role* (such as DevSecOps, SOC, GRC, Security Engineer, IT Security Specialists, etc.) and none of them are wrong, but from my experience, if you do not have a Home Lab and a Project to show case, your chances of **Breaking into Cybersecurity** are very slim. I hope this project will inspire those who want to break into the field, and be able to showcase what they learn.

## "How do I use (something like) this for a Cybersecurity Career?"
Most resumes have a "Project" section. Don't post my project on there (don't even fork it to your repository and post it, it won't work). Create your own GitHub, website, etc., and showcase your project on your resume under "Current Projects".  You can even post you project on [LinkedIn](https://www.linkedin.com/in/imjustinjohnson/).

## Updates
|Date        	|Description			
|-------------------|-------------------|
| December 2023 | Initial Project

## Hardware Used
For my HomeLab I am using:

 - Dell 5050 Small Form Factor Computer:
	 - i7-7700 Intel CPU
	 - 64GB Ram
	 - 128GB SSD Boot
	 - 256GB SSD Data
	 - 1TB NVMe Data(2)

## Software Used
|Purpose        	|Software			|Link						  |
|-------------------|-------------------|-----------------------------|
|Hypervisor			|VMWare/ESXI         	|https://www.vmware.com/           |
|Containers			|K3s				|https://k3s.io				|
|Siem				|Elastic Search		|https://www.elastic.co/elasticsearch         |
|Siem				|Kibana				|https://www.elastic.co/kibana|
|Siem				|Logstash			|https://www.elastic.co/logstash|
|Siem				|Beats				|https://www.elastic.co/beats|
|EDR				|Elastic Detection and Response|https://www.elastic.co/endpoint-detection-response|
| Vulnerability Scanning | Nessus Essentials |https://www.tenable.com/products/nessus/nessus-essentials |

  - More TBD

## Architecture Diagram

Coming Soon



# Implementation

Starting with [1 - SIEM Setup](https://github.com/initcyber/homelab_soc/blob/main/1%20-%20SIEM%20Setup/Install.md), installing a single node k3s to host the ELK stack

## Virtual Machine Requirements

Coming Soon



# Putting it all together

Coming Soon

## TBD

TBD



# Future Updates


The following is a list of items to be implemented into this project into the future. Items from this list will be brought to the top and as it is implemented. This is more of a "laundry list" of ideas/brain dump.

 - Python Script to take Data from Nessus Essentials (API) to ELK Stack
 - Implement self-hosted APT/RPM Repository for updating Linux Machines 
	 - [aptly](https://www.aptly.info/doc/overview/) or
	 - [lbr38/repomanager: A web UI to mirror rpm or deb packages repositories. (github.com)](https://github.com/lbr38/repomanager)
 - Automation through SOAR solution?
	 - The Hive?
 - (Much later) Add Domain Controller, connect to Azure, implement further with Intune for compliance?
 - (Much much later) - Implement AI into the mix to fully automate everything??
