FROM archlinux:latest

ARG kafkaversion=3.2.0
ARG scalaversion=2.13

RUN pacman -Syu --noconfirm && \
pacman -S wget jre-openjdk --noconfirm && \
wget https://dlcdn.apache.org/kafka/${kafkaversion}/kafka_${scalaversion}-${kafkaversion}.tgz && \
tar zxvf kafka_${scalaversion}-${kafkaversion}.tgz && \
rm kafka_${scalaversion}-${kafkaversion}.tgz && \
mv kafka_${scalaversion}-${kafkaversion} home/kafka

WORKDIR /home/kafka

RUN bin/kafka-storage.sh format -t $(bin/kafka-storage.sh random-uuid) -c config/kraft/server.properties

EXPOSE 9092 9093

CMD ["bin/kafka-server-start.sh", "config/kraft/server.properties"]