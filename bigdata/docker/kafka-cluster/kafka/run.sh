#!/bin/bash

sed -r -i "s/(zookeeper.connect)=(.*)/\1=$ZOOKEEPER_CONNECTIONS/g" $KAFKA_HOME/config/server.properties
sed -r -i "s/(broker.id)=(.*)/\1=$BROKER_ID/g" $KAFKA_HOME/config/server.properties
sed -r -i "s/#(advertised.host.name)=(.*)/\1=$BROKER_HOST/g" $KAFKA_HOME/config/server.properties
sed -r -i "s/^(port)=(.*)/\1=$BROKER_PORT/g" $KAFKA_HOME/config/server.properties

if [ "$KAFKA_HEAP_OPTS" != "" ]; then
    sed -r -i "s/^(export KAFKA_HEAP_OPTS)=\"(.*)\"/\1=\"$KAFKA_HEAP_OPTS\"/g" $KAFKA_HOME/bin/kafka-server-start.sh
fi

${KAFKA_HOME}/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties
