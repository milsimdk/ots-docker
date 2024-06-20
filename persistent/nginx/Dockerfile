# syntax=docker/dockerfile:1
FROM nginx:mainline-bookworm

# Copy nginx settings
COPY --chmod=0755 ./persistent/nginx/docker-entrypoint.d/10-default-ots.envsh /docker-entrypoint.d
COPY ./persistent/nginx/includes/ /etc/nginx/includes.d

HEALTHCHECK --interval=30s --start-period=30s CMD curl -k -I -A 'Docker-healthcheck' --fail http://localhost/health || exit 1

EXPOSE 80
