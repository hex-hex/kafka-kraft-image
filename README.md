# kafka-kraft

This image is built based on `archlinux` using `kraft` as the broker.

```shell
docker build -t hexhex/kafka-kraft . 
```

You can deploy a local stack with `docker-compose.yml` like:

```yml
version: "3"
services:
  kafka:
    image: hexhex/kafka-kraft:0.0.7
    ports:
      - 9092:9092
    volumes:
      - kafka-data:/tmp
  kafdrop:
    image: obsidiandynamics/kafdrop
    ports:
      - 9091:9000
    environment:
      KAFKA_BROKERCONNECT: kafka:9092
      JVM_OPTS: -Xms32M -Xmx64M 
      SERVER_SERVLET_CONTEXTPATH: /


volumes:
  kafka-data:
```

The UI can be accessed at `http://localhost:9091`