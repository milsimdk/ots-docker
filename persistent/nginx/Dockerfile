# syntax=docker/dockerfile:1
FROM nginx:mainline-bookworm
ARG OTS_ADDRESS=opentakserver \
    OTS_LISTENER_PORT=8081 \
    WEBUI_ADDRESS=opentakserver-webui

RUN rm -f /etc/nginx/sites-enabled/*

# Copy nginx settings
COPY ./persistent/nginx/conf.d/ /etc/nginx/conf.d
COPY ./persistent/nginx/includes/ /etc/nginx/includes.d
COPY ./persistent/nginx/sites-available/ /etc/nginx/sites-enabled
COPY ./persistent/nginx/streams-available/ /etc/nginx/streams-enabled

RUN sed -ri -e "s!OTS_ADDRESS!${OTS_ADDRESS}!g" /etc/nginx/conf.d/*.conf && \
    sed -ri -e "s!OTS_LISTENER_PORT!${OTS_LISTENER_PORT}!g" /etc/nginx/conf.d/*.conf && \
    sed -ri -e "s!WEBUI_ADDRESS!${WEBUI_ADDRESS}!g" /etc/nginx/conf.d/*.conf

RUN nl='\n' && echo "$nl\
    stream { $nl\
        include /etc/nginx/streams-enabled/*.conf; $nl\
    }" | tee -a /etc/nginx/nginx.conf

HEALTHCHECK --interval=30s --start-period=30s CMD curl -k -I -A 'Docker-healthcheck' --fail http://localhost/health || exit 1

EXPOSE 80
