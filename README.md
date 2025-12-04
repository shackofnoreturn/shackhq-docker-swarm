# ShackHQ Docker Swarm

  *A collection of Docker Swarm stack files & templates to be deployed in Portainer*


## What
- Renders complete and highly configurable docker compose stack files straight from a jinja template
- Alter variables for different environments
- Deploys straight to your Portainer instance in your preferred swarm cluster

### Contents
- `group_vars/`: All sets of global variables
- `playbooks`: Every docker swarm related playbook
- `roles/`: All roles used in the playbooks above
- `ansible.cfg`: Configuration variables for executing ansible tooling
- `README.md`: This file!


## How
### Render
*This renders docker compose files to create stacks.*

```bash
ansible-playbook playbooks/stacks-render.yml
```


### Deploy
*This deploys stacks in Portainer from the generated docker compose files*

```bash
ansible-playbook playbooks/stack-networking-proxy.yml --ask-vault-pass`
```


## Todo
- [ ] Enable GitOps updates

