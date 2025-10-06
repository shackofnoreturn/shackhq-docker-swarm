# Playbooks
 These playbooks are used to generate stacks and templates from a single configuration.

# Config
Alter/Add/Remove items from the `stacks.yml` file in the root directory.

## Create all stacks
```ansible-playbook playbooks/create_stack.yml```

*(Or if you want to execute a clean run:)*

```ansible-playbook create_stack.yml -e cleanup=true```
