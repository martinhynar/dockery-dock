#!/bin/bash

CP_VERSION=7.0.1
podman run -i --rm --name=schema_registry --pod=zookeeper-kafka-schema-registry -e SCHEMA_REGISTRY_HOST_NAME=schema-registry -e SCHEMA_REGISTRY_LISTENERS=http://0.0.0.0:8085 -e SCHEMA_REGISTRY_KAFKASTORE_BOOTSTRAP_SERVERS=kafka:29092 --add-host kafka:127.0.0.1 --add-host schema-registry:127.0.0.1 confluentinc/cp-schema-registry:${CP_VERSION}
