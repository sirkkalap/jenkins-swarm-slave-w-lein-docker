FROM sirkkalap/jenkins-swarm-slave

MAINTAINER Petri Sirkkala <sirpete@iki.fi>

USER root

RUN apt-get update

# Install git (just for fun :)
RUN apt-get -y install git

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
