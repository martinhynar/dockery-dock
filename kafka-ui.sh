#!/bin/bash

source versions

PODNAME=zookeeper-kafka-schema-registry

podman pod exists ${PODNAME}
if [[ $? == 1 ]]; then
    echo "Creating pod ${PODNAME}"
    podman pod create --name ${PODNAME} --publish 8085:8085 --publish 9092:9092 --publish 8086:8086
fi

podman run -i --rm \
    --name=kafka-ui \
    --pod=${PODNAME} \
    -e KAFKA_CLUSTERS_0_NAME=local \
    -e KAFKA_CLUSTERS_0_BOOTSTRAPSERVERS=kafka:29092 \
    -e SERVER_PORT=8086 \
    -e KAFKA_CLUSTERS_0_ZOOKEEPER=zookeeper:2181 \
    --add-host zookeeper:127.0.0.1 \
    --add-host kafka:127.0.0.1 \
    --add-host kafka-ui:127.0.0.1 \
    provectuslabs/kafka-ui:latest
