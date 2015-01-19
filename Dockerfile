# Base image
FROM csanchez/jenkins-swarm-slave

MAINTAINER Petri Sirkkala <sirpete@iki.fi>

USER root

# Time zone
RUN echo "Europe/Helsinki" > /etc/timezone \
 && dpkg-reconfigure --frontend=noninteractive tzdata

# Leiningen
ENV LEIN_ROOT 1
RUN curl -L -s https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > \
    /usr/local/bin/lein \
 && chmod 0755 /usr/local/bin/lein \
 && lein upgrade

USER jenkins-slave
