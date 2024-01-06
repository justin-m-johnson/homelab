#  Project Description
Welcome to my Home Lab SOC documentation where I plan on documenting how I set up my Home Lab as a mock Security Operations Center/Threat Detection/Blue Team lab and my journey in using free and open-source software. This documentation will also be posted on [my personal website](https://www.initcyber.com) and I may also do a [YouTube](https://www.youtube.com/@initcyber) video or two.


## Use Case

The use case for this documentation/project is to help people who want to be in Cybersecurity learn how to break into Cybersecurity. There are several avenues in which a person could perform a *Cybersecurity Role* (such as DevSecOps, SOC, GRC, Security Engineer, IT Security Specialists, etc.) and none of them are wrong, but from my experience, if you do not have a Home Lab and a Project to show case, your chances of **Breaking into Cybersecurity** are very slim. I hope this project will inspire those who want to break into the field, and be able to showcase what they learn.

## "How do I use (something like) this for a Cybersecurity Career?"
Most resumes have a "Project" section. Don't post my project on there (don't even fork it to your repository and post it, it won't work). Create your own GitHub, website, etc., and showcase your project on your resume under "Current Projects".  You can even post you project on [LinkedIn](https://www.linkedin.com/in/imjustinjohnson/).

## Updates
|Date        	|Description			
|-------------------|-------------------|
| December 2023 | Initial Project      |
| January 2024 | Software/Hardware Changes |

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
|Hypervisor			|Proxmox        	|https://www.proxmox.com/           |
|Security SIEM/Platform  	| Wazuh			| https://wazuh.com/	|
| SOAR/Incident Response	| The Hive		| https://thehive-project.com	|
| Malware Information Sharing/OSINT	| MISP			| https://www.misp-project.org/ 
| Vulnerability Scanning | Nessus Essentials |https://www.tenable.com/products/nessus/nessus-essentials |
| AV	| Windows Defender (Windows) and ClamAV (Linux)	| Varies

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



# Future Updates


The following is a list of items to be implemented into this project into the future. Items from this list will be brought to the top and as it is implemented. This is more of a "laundry list" of ideas/brain dump.

 - Python Script to take Data from Nessus Essentials (API) to ELK Stack
 - Implement self-hosted APT/RPM Repository for updating Linux Machines 
	 - [aptly](https://www.aptly.info/doc/overview/) or
	 - [lbr38/repomanager: A web UI to mirror rpm or deb packages repositories. (github.com)](https://github.com/lbr38/repomanager)
 - (Much later) Add Domain Controller, connect to Azure, implement further with Intune for compliance?
 - (Much much later) - Implement AI into the mix to fully automate everything??
