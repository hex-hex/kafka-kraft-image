import os
import shlex
import socket
import subprocess

LOG_NAME = 'kraft-combined-logs'
ADVERTISED_LISTENERS = os.environ.get('ADVERTISED_LISTENERS', 'kafka:9092')

with open('/home/kafka/config/kraft/server.properties', 'r') as f:
    config_file = f.read()

with open('/home/kafka/config/kraft/server.properties', 'w') as f:
    f.write(config_file.format(ADVERTISED_LISTENERS))


if LOG_NAME not in os.listdir('/tmp'):
    uuid = subprocess.check_output(shlex.split('/home/kafka/bin/kafka-storage.sh random-uuid')).decode().strip()
    subprocess.call(shlex.split(f'/home/kafka/bin/kafka-storage.sh format -t {uuid} -c /home/kafka/config/kraft/server.properties'))

subprocess.call(shlex.split("/home/kafka/bin/kafka-server-start.sh /home/kafka/config/kraft/server.properties"))