#!/bin/bash
set -e

if [[ $# -lt 1 ]] || [[ "$1" == "-"* ]]; then
    SWARM_CLIENT_JAR=`ls -1 ${SETUP_DIR}/swarm-client-*.jar | tail -n 1`

    if [[ "$@" != *"-master "* ]] && [ ! -z "$JENKINS_PORT_8080_TCP_ADDR" ]; then
        PARAMS="-master http://$JENKINS_PORT_8080_TCP_ADDR:$JENKINS_PORT_8080_TCP_PORT"
    fi

    echo Running java ${JAVA_OPTS} -jar ${SWARM_CLIENT_JAR} -fsroot ${JENKINS_WORKSPACE} ${PARAMS} "$@"

    set -x
    exec start-stop-daemon --start \
      --exec /usr/bin/java -- \
      ${JAVA_OPTS:- ${JAVA_OPTS}} \
      -jar ${SWARM_CLIENT_JAR} \
      -fsroot ${JENKINS_WORKSPACE} \
      ${PARAMS:- ${PARAMS}} "$@"
fi

exec "$@"
