#!/bin/bash

source versions

PODNAME=zookeeper-kafka-schema-registry

podman pod exists ${PODNAME}
if [[ $? == 1 ]]; then
    echo "Creating pod ${PODNAME}"
    podman pod create --name ${PODNAME} --publish 8085:8085 --publish 9092:9092 --publish 8086:8086
fi

podman run --tty -i --rm \
    --name=zookeeper \
    --pod=${PODNAME} \
    -e ZOOKEEPER_CLIENT_PORT=2181 \
    -e ZOOKEEPER_TICK_TIME=2000 \
    confluentinc/cp-zookeeper:${CONFLUENT_PLATFORM_VERSION}
