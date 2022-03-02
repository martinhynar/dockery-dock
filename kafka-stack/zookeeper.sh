#!/bin/bash

CP_VERSION=7.0.1
podman run --name=zookeeper -i --rm --pod=zookeeper-kafka-schema-registry -e ZOOKEEPER_CLIENT_PORT=2181 -e ZOOKEEPER_TICK_TIME=2000 --tty confluentinc/cp-zookeeper:${CP_VERSION}
