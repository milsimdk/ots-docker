# syntax=docker/dockerfile:1
ARG PGID=1000
ARG PUID=1000

# ***************************************************************************************************************************************
# First stage: builder
# ***************************************************************************************************************************************
FROM python:3.12 AS builder
ARG OTS_VERSION

# Make sure all messages always reach console
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Set working directory
WORKDIR /app/

# Create and activate virtual environment
# Using final folder name to avoid path issues with packages
RUN python3 -m venv /app/.opentakserver_venv
# Enable venv
ENV PATH="/app/.opentakserver_venv/bin:$PATH"

# Install Opentakserver
RUN pip3 install --no-cache-dir opentakserver==${OTS_VERSION}

# ***************************************************************************************************************************************
# Second stage: runtime
# ***************************************************************************************************************************************
FROM python:3.12-slim AS runtime
ARG OTS_VERSION
ARG PGID
ARG PUID

# Make sure all messages always reach console
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Activate virtual environment
ENV PATH="/app/.opentakserver_venv/bin:$PATH"

LABEL maintainer="https://github.com/milsimdk"
LABEL org.opencontainers.image.description="  is yet another open source TAK Server for ATAK, iTAK, and WinTAK"
LABEL org.opencontainers.image.authors="Brian - https://github.com/brian7704"
LABEL org.opencontainers.image.source="https://github.com/brian7704/OpenTAKServer"
LABEL org.opencontainers.image.version=${OTS_VERSION}
LABEL org.opencontainers.image.licenses="GNU General Public License v3.0"

# Fix for https://github.com/brian7704/OpenTAKServer/issues/15
RUN pip3 uninstall -y bcrypt && pip3 install --no-cache-dir bcrypt==4.0.1

# Create OTS user
RUN groupadd -g ${PGID:-1000} -r ots && \
    useradd -u ${PUID:-1000} -g ${PGID:-1000} -m -d /app ots && \
    mkdir /app/ots/ &&  chown -R ots:ots /app

# Set working directory
WORKDIR /app/ots

# Copy opentakserver from build image
COPY --from=builder /app/.opentakserver_venv /app/.opentakserver_venv

USER ots

# Flask will stop gracefully on SIGINT (Ctrl-C).
# docker-compose tries to stop processes using SIGTERM by default, then sends SIGKILL after a delay if the process doesn't stop.
STOPSIGNAL SIGINT

CMD [ "python3", "-m" , "opentakserver.app"]

#ENV FLASK_APP=App.py
#CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
