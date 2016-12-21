FROM elasticsearch:2.4.2

ENV ES_JAVA_OPTS="-Xms512m -Xmx512m -Des.path.conf=/etc/elasticsearch"

RUN plugin install license && plugin install marvel-agent
