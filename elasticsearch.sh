#!/bin/bash

source versions

PODNAME=elk

podman pod exists ${PODNAME}
if [[ $? == 1 ]]; then
    echo "Creating pod ${PODNAME}"
    podman pod create --name ${PODNAME} --publish 9200:9200 --publish 9300:9300
fi

podman run -i --rm  \
    --name elasticsearch \
    --pod=${PODNAME} \
    -e "cluster.name=docker-es-cluster" \
    -e "bootstrap.memory_lock=true" \
    -e "discovery.type=single-node" \
    -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" \
    -e "http.port=9200" \
    -e "http.cors.enabled=true" \
    -e "http.cors.allow-origin=http://localhost:1358,http://127.0.0.1:1358" \
    -e "http.cors.allow-headers=X-Requested-With,X-Auth-Token,Content-Type,Content-Length,Authorization" \
    -e "http.cors.allow-credentials=true" \
    -e "cluster.routing.allocation.disk.threshold_enabled=false" \
    -e "cluster.routing.allocation.disk.watermark.low=99%" \
    -e "cluster.routing.allocation.disk.watermark.high=99%" \
    -e "cluster.routing.allocation.disk.watermark.flood_stage=99%" \
    elasticsearch:${ELASTICSEARCH_VERSION}



