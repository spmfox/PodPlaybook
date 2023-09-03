# PodPlaybook

Ansible playbook for deploying and managing Podman containers.

![PodPlaybook](docs/images/logo.png)

This playbook is for deploying and managing Podman containers in a reproducible way.
By default it will create systemd service files and is compatible with or without the use of pods.

## Usage
- ```ansible-playbook host.yml```
- ```ansible-galaxy install -r collections/requirements.yml```
- ```ansible-playbook containers.yml -e @docs/sample-environment/wordpress.yml```
