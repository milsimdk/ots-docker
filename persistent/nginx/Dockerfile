# syntax=docker/dockerfile:1
FROM python:3.12-slim as build

WORKDIR /build

RUN pip3 install lastversion
RUN lastversion --assets extract brian7704/OpenTAKServer-UI

FROM nginx:mainline-bookworm
ARG OTS_ADDRESS=opentakserver \
    OTS_LISTENER_PORT=8081

# Copy nginx settings
COPY ./persistent/nginx/conf.d /etc/nginx/conf.d
COPY ./persistent/nginx/includes/ /etc/nginx/includes.d

RUN sed -ri -e "s!OTS_ADDRESS!${OTS_ADDRESS}!g" /etc/nginx/conf.d/*.conf && \
    sed -ri -e "s!OTS_LISTENER_PORT!${OTS_LISTENER_PORT}!g" /etc/nginx/conf.d/*.conf

# Copy OTS WebUI from build stage
COPY --from=build /build /usr/share/nginx/html/

EXPOSE 80
