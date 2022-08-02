FROM archlinux:latest

ARG kafkaversion=3.2.0
ARG scalaversion=2.13

RUN pacman -Syu --noconfirm && \
pacman -S wget jre-openjdk python --noconfirm && \
wget https://dlcdn.apache.org/kafka/${kafkaversion}/kafka_${scalaversion}-${kafkaversion}.tgz && \
tar zxvf kafka_${scalaversion}-${kafkaversion}.tgz && \
rm kafka_${scalaversion}-${kafkaversion}.tgz && \
mv kafka_${scalaversion}-${kafkaversion} home/kafka

COPY start.py /home/start.py

EXPOSE 9092 9093

CMD ["python", "/home/start.py"]