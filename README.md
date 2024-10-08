# PodPlaybook

Ansible playbook for deploying and managing Podman containers.

![PodPlaybook](docs/images/logo.png)

This repo contains two roles, `host` and `containers`, that automate the deployment of Podman containers using quadlet.
Quadlet files and some understanding of quadlet and/or systemd is required to use this tool.

## Usage
    ansible-playbook host.yml
    sudo machinectl shell containers@
    ansible-playbook -i docs/sample-environment/wordpress/wordpress.yml containers.yml

## Features
- Designed for rootless Podman
- Easily deploy/remove quadlet files and stop/start quadlet services
- Define your application's quadlet files so they are treated as one entity with Ansible

## Sample Environment
A fully working pod with Wordpress and a MariaDB database are in the `docs/sample-environment/wordpress` directory.
The environment variables are in `wordpress.yml`, you'll also find the containerfiles and the quadlet files.

## Requirements
- Ansible
- Podman
- User with `sudo` rights (to create unprivileged user)

## Operation
- **Note:** `host.yml` and `containers.yml` will default to execute on localhost if a host isn't provided
    - This means you can either create a full inventory with a host and variables or just variables that will be run against localhost
- `host.yml` - installs the needed packages and creates the `containers` unprivileged user - use with a privileged account
- `containers.yml` - will copy the quadlet files and start the quadlet - use with the unprivileged account

## Tags
- `host.yml`:
    - `unprivileged-port` - configures host to allow unprivileged accounts to use privileged ports, defaults to `80`
    - `cpanel-dnsonly` - changes only needed when running on a dnsonly cPanel instance, check `roles/host/tasks/cpanel-dnsonly.yml` for details
- `containers.yml`:
    - `create` - create quadlet files
    - `remove` - remove quadlet files
    - `start` - start quadlet services
    - `stop` - stop quadlet services
