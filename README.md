[![Docker Image CI to Docker Hub](https://github.com/craph/docker-mole-hole/actions/workflows/docker-image.yml/badge.svg)](https://github.com/craph/docker-mole-hole/actions/workflows/docker-image.yml)
# Docker Mole Hole

This Docker creates a simple local forward SSH tunnel over a server. It is very useful when your container needs to access to an external protected resource. In this case this container might behave like a proxy to outer space inside your Docker network.

## Usage

1. Don't forget to put your private key (`id_rsa`) to `~/.ssh` folder.

2. To run the docker image you can use docker-compose or a simple docker run command :

```yaml
version: '3'
services:
  dmh:
    image: craf/docker-mole-hole:latest
    volumes:
      - $HOME/.ssh/id_rsa:/home/mole/.ssh/id_rsa:ro
    command: "<LOCAL_IP>:<LOCAL_PORT>:<REMOTE_IP>:<REMOTE_PORT> <TUNNEL_HOST> -p <CUSTOM_TUNNEL_PORT>"
```

```bash
docker run --rm --name mytunnel -v $HOME/.ssh/id_rsa:/home/mole/id_rsa:ro craf/docker-mole-hole:latest *:<LOCAL_PORT>:<REMOTE_IP>:<REMOTE_PORT> <TUNNEL_HOST> -p <CUSTOM_TUNNEL_PORT>
```

5. Run `docker-compose up -d`

After you start up docker containers, any container in the same network will be able to access to tunneled instance.
