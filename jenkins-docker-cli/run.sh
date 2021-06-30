#! /bin/sh

# example to run the container
docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home --rm -d --group-add $(stat -f '%g' /var/run/docker.sock) -v /var/run/docker.sock:/var/run/docker.sock -P jenkins-docker
