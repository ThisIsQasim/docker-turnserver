docker-turnserver
=================
***It turns out, coturn setup on debian is stupidly simple. Which makes this repo completely useless and makes me feel like an idiot. Anyways***

A Docker container with the Coturn STUN and TURN server (https://github.com/coturn/coturn) based on debian image.
You'll have to provide a valid config file at /etc/turnserver.conf inside the container. Either mount it as a volume or copy it in the Dockerfile before building.

```
docker build . -t turnserver
docker run -d --name=turnserver --restart="on-failure:10" -v /path/to/config:/etc/turnserver.conf --net=host -p 3478:3478 -p 3478:3478/udp turnserver
```
