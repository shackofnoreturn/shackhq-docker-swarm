# Traefik Stack for Docker Swarm

## Overview
This repository provides a standardized Docker Swarm stack for deploying Traefik as a reverse proxy with automatic HTTPS via Let's Encrypt.

## Files
- `docker-compose.yml`: Swarm-compatible compose file.
- `docker-compose-processed.yml`: Compose file processed with .env variables.
- `.env`: Runtime configuration.
- `configs/`: Configuration files for Traefik.
- `secrets/`: Secrets for the Traefik dashboard.
- `portainer-template.json`: For Portainer's Template UI.

## Certificates
*Generate self signed certificate for development.*
```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout certs/traefik-dev.key -out certs/traefik-dev.crt \
  -subj "/CN=*.dev.shackofnoreturn.com"
```

## Dashboard Credentials
*Generate hashed username/password pair.*
```bash
htpasswd -nb admin "P@ssw0rd" | sed -e 's/\$/\$\$/g'
```

## Build
*Process docker-compose.yml and push to Github repo.*
```bash
set -a; . ./.env; set +a
envsubst <docker-compose.yml >docker-compose.processed.yml
```

## Deploy Stack
*Go to development node in Portainer*
- Name: documentation
- Repository URL: https://github.com/shackofnoreturn/shackhq-docker-swarm.git
- Repository reference: refs/heads/dev
- Compose path: stacks/traefik/docker-compose.processed.yml
