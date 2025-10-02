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

## Build
*Build stack.yml and push to Github repo*
```bash
docker compose --env-file .env config > stack.yml
```

## Deploy Stack
*Go to development node in Portainer*
- Name: documentation
- Repository URL: https://github.com/shackofnoreturn/shackhq-docker-swarm.git
- Repository reference: refs/heads/dev
- Compose path: stacks/traefik/stack.yml
