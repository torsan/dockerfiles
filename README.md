# After the image was build we must open a root shell
docker exec --user root -it brave_wu /bin/sh

# Change user and group of the socket
chgrp daemon /var/run/docker.sock
chown jenkins /var/run/docker.sock

# Test if jenkins user can execute docker cli
# We open a new shell under the Jenkins user privileges
docker exec -it brave_wu /bin/sh
# execute a docker command
docker ps

## Container configuration finished. We can use Docker in Jenkins Pipeline now
docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home --rm -d --group-add $(stat -f '%g' /var/run/docker.sock) -v /var/run/docker.sock:/var/run/docker.sock -P jenkins-docker
