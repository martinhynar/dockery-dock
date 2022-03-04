#!/bin/bash

source versions

PODNAME=zookeeper-kafka-schema-registry

podman pod exists ${PODNAME}
if [[ $? == 1 ]]; then
    echo "Creating pod ${PODNAME}"
    podman pod create --name ${PODNAME} --publish 8085:8085 --publish 9092:9092 --publish 8086:8086
fi

podman run -i --rm --tty \
    --name=schema_registry \
    --pod=${PODNAME} \
    -e SCHEMA_REGISTRY_HOST_NAME=schema-registry \
    -e SCHEMA_REGISTRY_LISTENERS=http://0.0.0.0:8085 \
    -e SCHEMA_REGISTRY_KAFKASTORE_BOOTSTRAP_SERVERS=kafka:29092 \
    --add-host kafka:127.0.0.1 \
    --add-host schema-registry:127.0.0.1 \
    confluentinc/cp-schema-registry:${CONFLUENT_PLATFORM_VERSION}
