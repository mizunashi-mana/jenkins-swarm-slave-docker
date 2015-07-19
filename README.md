# Jenkins swarm slave

[`mizunashi/jenkins-swarm-slave`](https://registry.hub.docker.com/u/mizunashi/jenkins-swarm-slave/)

A [Jenkins swarm](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin) slave.

For a container with ssh enabled see
[`mizunashi/jenkins-slave`](https://registry.hub.docker.com/u/mizunashi/jenkins-slave/)

For a container with many build tools installed see
[`maestrodev/build-agent`](https://registry.hub.docker.com/u/maestrodev/build-agent/)

## Running

    docker run -e JENKINS_MASTER="http://jenkins:8080" -e JENKINS_USERNAME=jenkins -e JENKINS_PASSWORD=jenkins -e JENKINS_EXECUTORS=1 -d mizunashi/jenkins-swarm-slave

Linking to the Jenkins master container there is no need to use `-master`

    docker run -d --name myjenkins -p 8080:8080 mizunashi/jenkins
    docker run -d --link myjenkins:jenkins -e JENKINS_USERNAME=jenkins -e JENKINS_PASSWORD=jenkins -e JENKINS_EXECUTORS=1 mizunashi/jenkins-swarm-slave


# Building

```
$ make build
```

# Require Environments

See also, [Jenkins swarm parameters](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin#SwarmPlugin-AvailableOptions)

Value type:

 * CONST - Contant value.  Dockerfile provided.  You can use entrypoint, building run or etc.
 * SETTABLE - Settable value.  You can set the value when `docker run` with `-e` or `--env` option.

  | Name                  | Type     | Description |
  |-----------------------|----------|-------------|
  | JENKINS_WORKUSER      | CONST    | Setted `jenkins`. This is work username for SSH login. |
  | JENKINS_WORKSPACE     | CONST    | Setted `/var/jenkins_ws`. This is work user's home dir. |
  | SETUP_DIR             | CONST    | Setted `/var/cache/jenkins_ws`. This is to lie setup files. |
  | JENKINS_MASTER        | SETTABLE | If this value was setted, `docker` set target URL for jenkins master. |
  | JENKINS_USERNAME      | SETTABLE | If this value was setted, `docker` set jenkins username for authentication. |
  | JENKINS_PASSWORD      | SETTABLE | If this value was setted, `docker` set jenkins user password. |
  | JENKINS_NAME          | SETTABLE | If this value was setted, `docker` set name of jenkins slave. |
  | JENKINS_EXECUTORS     | SETTABLE | If this value was setted, `docker` set number of executors for jenkins slave. |
  | JENKINS_LABELS        | SETTABLE | If this value was setted, `docker` set whitespace-separated list of labels. |

