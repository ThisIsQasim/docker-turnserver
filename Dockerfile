FROM debian:stretch-slim

# Set correct environment variables.
ENV HOME /root

RUN apt-get update && apt-get dist-upgrade -y

RUN apt-get install -y coturn

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD /usr/bin/turnserver --no-cli
