# PodPlaybook

Ansible playbook for deploying and managing Podman containers.

![PodPlaybook](docs/images/logo.png)

This repo contains two roles, `host` and `containers`, that automate the deployment of Podman containers using quadlet.
Quadlet files and some understanding of quadlet and/or systemd is required to use this tool.

## Usage
    ansible-playbook host.yml
    sudo machinectl shell containers@
    ansible-galaxy install -r collections/requirements.yml
    ansible-playbook containers.yml

## Features
- Designed for rootless Podman
- Easily deploy/remove quadlet files and stop/start quadlet services
- Define your application's quadlet files so they are treated as one entity with Ansible

## Sample Environment
A fully working pod with Wordpress and a MariaDB database are in the `docs/sample-environment` directory.
The default variables in the `container` role will use this sample environment for deployment.
Provide your own inventory and/or variables to override this.

## Requirements
- Ansible
- Ansible collections:
    - ```ansible-galaxy install -r collections/requirements.yml```
- Podman
- User with `sudo` rights (to create unprivileged user)

## Operation
- `host.yml` - installs the needed packages and creates the `containers` unprivileged user - use with a privileged account
- `containers.yml` - will copy the quadlet files and start the quadlet - use with the unprivileged account

## Tags
- `host.yml`:
    - `unprivileged-ports` - configures host to allow port `80` and above to be used by unprivileged accounts
    - `cpanel-dnsonly` - changes only needed when running on a dnsonly cPanel instance, check `roles/host/tasks/cpanel-dnsonly.yml` for details
- `containers.yml`:
    - `create` - create quadlet files
    - `remove` - remove quadlet files
    - `start` - start quadlet services
    - `stop` - stop quadlet services
