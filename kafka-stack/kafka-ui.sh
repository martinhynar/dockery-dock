#!/bin/bash

podman run -i --rm --name=kafka-ui --pod=zookeeper-kafka-schema-registry -e KAFKA_CLUSTERS_0_NAME=local -e KAFKA_CLUSTERS_0_BOOTSTRAPSERVERS=kafka:29092 -e SERVER_PORT=8086 -e KAFKA_CLUSTERS_0_ZOOKEEPER=zookeeper:2181 --add-host zookeeper:127.0.0.1 --add-host kafka:127.0.0.1 --add-host kafka-ui:127.0.0.1 provectuslabs/kafka-ui:latest
