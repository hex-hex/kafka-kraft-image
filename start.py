import os
import shlex
import socket
import subprocess

CONFIG_PATH = '/home/kafka/config/kraft/server.properties'

ADVERTISED_LISTENERS = os.environ.get('ADVERTISED_LISTENERS', 'kafka:9092')

with open(CONFIG_PATH, 'r') as f:
    config_file = f.read()

with open(CONFIG_PATH, 'w') as f:
    f.write(config_file.format(ADVERTISED_LISTENERS))

LOG_NAME = 'kraft-combined-logs'

if LOG_NAME not in os.listdir('/tmp'):
    uuid = subprocess.check_output(shlex.split('/home/kafka/bin/kafka-storage.sh random-uuid')).decode().strip()
    subprocess.call(shlex.split(f'/home/kafka/bin/kafka-storage.sh format -t {uuid} -c {CONFIG_PATH}'))

subprocess.call(shlex.split(f"/home/kafka/bin/kafka-server-start.sh {CONFIG_PATH}"))