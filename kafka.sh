#!/bin/bash

source versions

PODNAME=zookeeper-kafka-schema-registry

podman pod exists ${PODNAME}
if [[ $? == 1 ]]; then
    echo "Creating pod ${PODNAME}"
    podman pod create --name ${PODNAME} --publish 8085:8085 --publish 9092:9092 --publish 8086:8086
fi

podman run -i --rm \
    --name=kafka \
    --pod=${PODNAME} \
    -e KAFKA_BROKER_ID=1 \
    -e KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181 \
    -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://kafka:29092,PLAINTEXT_HOST://localhost:9092 \
    -e KAFKA_LISTENER_SECURITY_PROTOCOL_MAP=PLAINTEXT:PLAINTEXT,PLAINTEXT_HOST:PLAINTEXT \
    -e KAFKA_INTER_BROKER_LISTENER_NAME=PLAINTEXT \
    -e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 \
    --add-host zookeeper:127.0.0.1 \
    --add-host kafka:127.0.0.1 \
    confluentinc/cp-kafka:${CONFLUENT_PLATFORM_VERSION}
