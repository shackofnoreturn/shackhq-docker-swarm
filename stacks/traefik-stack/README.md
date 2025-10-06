# Traefik Stack

## Overview
Traefik reverse proxy with WhoIs service for testing.

## Files
- 'README.md' – This file.
- `docker-compose.yml` – Swarm-compatible compose file.
- `portainer-template.json` – For Portainer's Template UI.

- `.env` – Runtime configuration.
- `configs/` – Config objects for the service.
- `secrets/` – Secrets for the service.

## Deploy
### Portainer
*Go to preferred node in Portainer > Stacks*
- Name: traefik-stack
- Repository URL: https://github.com/shackofnoreturn/shackhq-docker-swarm.git
- Repository reference: refs/heads/dev
- Compose path: stacks/traefik/docker-compose.yml
