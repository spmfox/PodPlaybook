# PodPlaybook

Ansible playbook for deploying and managing Podman containers.

![PodPlaybook](docs/images/logo.png)

This playbook is for deploying and managing Podman containers in a reproducible way.
By default it will create systemd service files and is compatible with or without the use of pods.

## Usage
- ```ansible-playbook host.yml```
- ```machinectl shell containers@```
- ```ansible-galaxy install -r collections/requirements.yml```
- ```ansible-playbook containers.yml -e @docs/sample-environment/wordpress.yml```

## Features
- Declare container environment using Ansible variables file
- Rebuild, stop, start, enable systemd service, disable + remove systemd files
- One command for re-build image, re-generate systemd unit files
- Utilizes rootless Podman

## Sample Environment
A fully working pod with Wordpress and a MariaDB database are in the ```docs/sample-environment``` directory.

## Requirements
- Ansible
- Ansible collections
  - ```ansible-galaxy install -r collections/requirements.yml```
- Podman
- User with ```sudo``` rights

## Assumptions
- Rootless mode is being used, so tasks are written to use systemd user scope
  - Tasks would need to be tweaked for using the root user
- ```containers``` user is automatically created during the ```host.yml``` play

## Limitations
- Tasks were written to be run as the unprivileged user - however this is tricky in Ansible
  - Because of this, I recommend using ```machinectl shell containers@``` to become user before running the ```containers.yml``` play
  - Your milage may vary if you use another method of changing users
