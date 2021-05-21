# syntax=docker/dockerfile:1
FROM alpine:3.13.5

LABEL Name=docker-mole-hole Version=0.0.1

ARG UID=1000
ARG GID=1000

# Install autossh
RUN apk add --update autossh && rm -rf /var/cache/apk/*

# Create a group and user
RUN addgroup -g $GID moleG && adduser -u $UID -S mole -G moleG

# Tell docker that all future commands should run as the appuser user
USER mole

# Create .ssh folder for the user mole
RUN mkdir -p /home/mole/.ssh

ENTRYPOINT [ "/usr/bin/autossh", "-M", "0", "-T", "-oStrictHostKeyChecking=no", "-oPubkeyAuthentication=yes", "-oPasswordAuthentication=no", "-NL" ]