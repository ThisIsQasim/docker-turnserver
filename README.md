docker-turnserver
=================

A Docker container with the Coturn STUN and TURN server (https://github.com/coturn/coturn) based on debian image.

This is currently running v4.4.5.3.

```
docker build . -t turnserver
docker run -d --name=turnserver --restart="on-failure:10" --net=host -p 3478:3478 -p 3478:3478/udp turnserver
```

You'll have to provide a valid config file at /etc/turnserver.conf inside the container. Either mount it as a volume or copy it in the Dockerfile before building.
