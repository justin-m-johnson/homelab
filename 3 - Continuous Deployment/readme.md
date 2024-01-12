# About
This folder and its Ansible scripts will provide a Continuous Deployment environment using Github Actions after the CI process is completed.


## Notes
For continuous deployment, we are utilizing GitHub Actions to build and deploy applications to a Blue/Green Environment (two VM's). GitHub Actions will be connected to the local environment through the use of Tailscale for a "one to one" connection to each environment as defined.

## Still to do
- Develop Github Actions Scripts
- 
### Future To Do
The environments will need a load balancer configured via Ansible Scripts that can be deployed through actions in order to swap from "Blue" to "Green"

### Installation:
- Clone this repository 
- CD (change directory) into 2 - Continuous Deployment -> CD-Build -> blue-green-install folder -> vars , create a file named "tailscalekey.ini" and import your tsauth-key string from Tailscale
- Change your hosts file (Infrastructure/hosts) and any other variables within the document
```bash
ansible-playbook -i hosts build.yml -u <<user>> -K
```
#### Installation of Git Hub Actions into your repository
- Copy the Github Actions Script (Folder: [GHA_Script](/homelab_devsecop/3%20-%20Continuous%20Deployment/CD-Build/GHA_Script/)) into the "Actions" of your Repository that you want to start "deploying" into the above mentioned blue/green VM 
- Copy your "secrets" into the Github Secrets of your repository, including:
  - Your Docker Username and Docker Token (DOCKER_USERNAME and DOCKERHUB_Token) (Refer to "Resources" below)
  - Your Tailscale Key (TS_OAUTH_CLIENT_ID and TS_OAUTH_SECRET) (Refer to "Resources" below)
  - I had an error about my test repository having Upper Case letters (buildx failed with: ERROR: invalid tag "***/Python_Test_CICD:latest": repository name must be lowercase) . Rename your test repository to lower case.
### Resources
https://tailscale.com/kb/1215/oauth-clients
https://docs.docker.com/language/python/configure-ci-cd/
https://github.com/marketplace/actions/connect-tailscale
