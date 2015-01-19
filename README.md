# jenkins-swarm-slave-w-lein-docker

Dockerfile for running [Leiningen](https://github.com/technomancy/leiningen) in
[Jenkins Swarm Slave](https://github.com/carlossg/jenkins-swarm-slave-docker).

## Usage

1. Build the image:

```bash
docker build -t sirkkalap/jenkins-swarm-slave-w-lein .
```

2. Run swarm slave:

```bash
docker run --rm --link jenkins-master:jenkins \
sirkkalap/jenkins-swarm-slave-w-nodejs:latest -username \
jenkins -password jenkins -executors 1
```
