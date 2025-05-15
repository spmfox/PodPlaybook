# PodPlaybook

Ansible playbook for deploying and managing Podman containers.

![PodPlaybook](docs/images/logo.png)

This repo contains two roles, `host` and `containers`, that automate the deployment of Podman containers using quadlet.
Quadlet files and some understanding of quadlet and/or systemd is required to use this tool.

## Usage
    git clone https://github.com/spmfox/PodPlaybook.git && cd PodPlaybook
    ansible-galaxy install -r collections/requirements.yml
    ansible-playbook host.yml

    sudo machinectl shell containers@
    git clone https://github.com/spmfox/PodPlaybook.git && cd PodPlaybook
    ansible-playbook -i docs/sample-environment/wordpress/wordpress.yml containers-local.yml

## Features
- Designed for rootless Podman
- Easily deploy/remove quadlet files and stop/start quadlet services
- Define your application's quadlet files so they are treated as one entity with Ansible
- Optionally configure your host with common settings like firewall, timezone, mounts, etc

## Sample Environment
A fully working pod with Wordpress and a MariaDB database are in the `docs/sample-environment/wordpress` directory.
The environment variables are in `wordpress.yml`, you'll also find the containerfiles and the quadlet files.

## Example Inventory
A example inventory is included in `docs/example-inventory.yml` showing all of the common host configuration variables as well as multiple quadlets.

## Requirements
- Ansible
- Podman
- User with `sudo` rights (to create unprivileged user)

## Operation
- `host.yml` - configures the host - can be run remotely or locally
  - Default operation is to install podman and create+configure the containers user
  - Can be used for configuring:
    - hostname
    - timezone
    - mounts
    - additional packages
    - unprivileged users port access
    - automatic patching
    - ssh hardening
    - firewall
- `containers-local.yml` - automates Quadlet file deployment and systemd Quadlet service start/stop
  - Used on localhost only
  - Designed to be run as the unprivileged containers user, but can be run as any user
- `containers-remote.yml` - same functionality as the local, except its designed to be run remotely
  - Because `machinectl` has to be used to manage the Quadlet systemd services, you are forced to use the root user for ssh

## Tags
- `containers-local.yml` & `containers-remote.yml`:
    - `create` - create quadlet files
    - `remove` - remove quadlet files
    - `start` - start quadlet services
    - `stop` - stop quadlet services
