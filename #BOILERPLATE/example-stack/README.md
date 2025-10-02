# MyService Stack

## Overview
This repository provides a standardized Docker Swarm stack for `myservice`.  
It includes Compose, env, configs, secrets, and Portainer template files for reproducible deployments.

## Files
- `docker-compose.yml` – Swarm-compatible compose file.
- `.env` – Runtime configuration.
- `.env.example` – Template for new environments.
- `configs/` – Config objects for the service.
- `secrets/` – Secrets for the service.
- `portainer-template.json` – For Portainer's Template UI.
- `boilerplate.template.json` – A skeleton for new services.

## Deployment
```bash
docker stack deploy -c docker-compose.yml ${SERVICE_NAME}
