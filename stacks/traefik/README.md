# Traefik v3.1 Stack for Docker Swarm

## Overview
This repository provides a standardized Docker Swarm stack for deploying Traefik v3.1 as a reverse proxy with automatic HTTPS via Let's Encrypt.

## Files
- `docker-compose.yml`: Swarm-compatible compose file.
- `.env`: Runtime configuration.
- `.env.example`: Template for new environments.
- `configs/`: Configuration files for Traefik.
- `secrets/`: Secrets for the Traefik dashboard.
- `portainer-template.json`: For Portainer's Template UI.
- `boilerplate.template.json`: A skeleton for new services.

## Deployment
```bash
docker stack deploy -c docker-compose.yml ${SERVICE_NAME}

## Creating Stack
*Go to development node in Portainer*

- Name: documentation
- Repository URL: https://github.com/shackofnoreturn/shackhq-docker-swarm.git
- Repository reference: refs/heads/dev
- Compose path: stacks/traefik/docker-compose.traefik.yml
