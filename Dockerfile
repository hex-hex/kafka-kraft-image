FROM archlinux:latest

ARG kafkaversion=3.2.0
ARG scalaversion=2.13

RUN pacman -Syu --noconfirm && \
pacman -S wget jre-openjdk python --noconfirm && \
wget https://dlcdn.apache.org/kafka/${kafkaversion}/kafka_${scalaversion}-${kafkaversion}.tgz && \
tar zxvf kafka_${scalaversion}-${kafkaversion}.tgz && \
rm kafka_${scalaversion}-${kafkaversion}.tgz && \
mv kafka_${scalaversion}-${kafkaversion} home/kafka

<<<<<<< Updated upstream
COPY config/kraft/server.properties /home/kafka/config/kraft/server.properties
COPY start.py /home/start.py
=======
WORKDIR /home/kafka

# RUN bin/kafka-storage.sh format -t $(bin/kafka-storage.sh random-uuid) -c config/kraft/server.properties
>>>>>>> Stashed changes

# EXPOSE 9092 9093

<<<<<<< Updated upstream
CMD ["python", "/home/start.py"]
=======
# CMD ["bin/kafka-server-start.sh", "config/kraft/server.properties"]
>>>>>>> Stashed changes
