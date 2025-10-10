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

-- TODO: Remove this section --
## Other
### Certificates
*Generate self signed certificate for development.*
```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout certs/traefik-dev.key -out certs/traefik-dev.crt \
  -subj "/CN=*.dev.shackofnoreturn.com"
```

### Dashboard Credentials
*Generate hashed username/password pair.*
```bash
htpasswd -nb admin "P@ssw0rd" | sed -e 's/\$/\$\$/g'
```
