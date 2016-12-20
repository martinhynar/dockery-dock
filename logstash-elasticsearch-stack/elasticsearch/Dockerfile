FROM elasticsearch:2.4.2

ARG nodename
ARG master
ARG data

ENV ES_JAVA_OPTS="-Xms512m -Xmx512m -Des.path.conf=/etc/elasticsearch"

CMD ["-E" "es.cluster.name=eso" "-E" "es.node.name=${nodename}" "-E" "es.node.master=${master}" "-E" "es.node.data=${data}" "-E", "network.host=0.0.0.0", "-E", "discovery.zen.minimum_master_nodes=1"]

RUN plugin install license && plugin install marvel-agent
