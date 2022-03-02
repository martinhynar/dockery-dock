# Kafka Stack

Couple of scripts that setup Confluent Kafka and other components and interconnect them

Run order:

1. Zookeeper - everything else needs zookeeper
2. Kafka - Schema Registry needs Kafka to store schemas
3. Schema Registry
4. Kafka UI


In host system, you have all components available:

Zookeeper: localhost:2181
Kafka: localhost:9092
Schema Registry: localhost:8085
Kafka UI: localhost:8086