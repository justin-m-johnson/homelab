# DevContainerPythonTemplate
This is a Dev Container Python Template that can be used as a base for a DevSecOp's environment

You can use this in Githubs Codespaces or cloning the repository and running it in vscode (as a devcontainer)

Examples of Codespace Below:

![Example 1]("/assets for README.md/image.png")

![Example 2]("/assets for README.md/image.png")

If you choose to use this container, you can safely remove "assets for README.md" folder and the README.md file

## Pre-Commit Information
This has Python 3 Installed, black, flake8, pre-commit (with pre-commit-config.yaml)

## How to use this
Copy everything in 0-Development Environment Files -> DevContainers -> Python-Template to another repository (your own)

#### For VS Code
Then using VSCode, install DevContainers extension

In VSCode command prompt, use "DevContainers Clone Repository in Container Volume", citing your github repository (name/repo) and follow the prompts.

#### For Codespaces
Navigate to Github Repo and click on "Code" and then "Codespaces"

Tailor this devcontainer to your own environment as necessary. This can be utilized to develop a container directly into (for python projects) or you can further setup a "Docker in Docker" container to program and launch develop docker containers directly within this container to deploy your container host.