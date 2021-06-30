FROM jenkins/jenkins

# Docker client installation
USER root
RUN apt-get update && apt-get install -y \
       apt-transport-https \
       ca-certificates \
       curl \
       gnupg2 \
       software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) \
       stable"
RUN apt-get update && apt-get install -y docker-ce-cli

# file must already exist before mounting from host
RUN touch /var/run/docker.sock
# change user:group permission to grant Jenkins user to access docker of the host system 
RUN chown jenkins:daemon /var/run/docker.sock

USER jenkins
