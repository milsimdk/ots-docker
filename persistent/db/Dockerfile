FROM postgres:18-trixie

LABEL maintainer="PostGIS Project - https://postgis.net" \
    org.opencontainers.image.description="PostGIS 3.6.1+dfsg-1.pgdg13+1 spatial database extension with PostgreSQL 18 trixie" \
    org.opencontainers.image.source="https://github.com/postgis/docker-postgis"

ENV POSTGIS_MAJOR=3
ENV POSTGIS_VERSION=3.6.1+dfsg-1.pgdg13+1

RUN apt-get update \
    && apt-cache showpkg postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR \
    && apt-get install -y --no-install-recommends \
    # ca-certificates: for accessing remote raster files;
    #   fix: https://github.com/postgis/docker-postgis/issues/307
    ca-certificates \
    \
    postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR \
    postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR-scripts \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./persistent/db/initdb-postgis.sh /docker-entrypoint-initdb.d/10_postgis.sh
COPY ./persistent/db/update-postgis.sh /usr/local/bin
