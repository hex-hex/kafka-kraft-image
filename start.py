import os
import shlex
import socket
import subprocess

LOG_NAME = 'kraft-combined-logs'

# local_ip = socket.gethostbyname(socket.gethostname())

if LOG_NAME not in os.listdir('/tmp'):
    uuid = subprocess.check_output(shlex.split('/home/kafka/bin/kafka-storage.sh random-uuid')).decode().strip()
    subprocess.call(shlex.split(f'/home/kafka/bin/kafka-storage.sh format -t {uuid} -c /home/kafka/config/kraft/server.properties'))

subprocess.call(shlex.split("/home/kafka/bin/kafka-server-start.sh /home/kafka/config/kraft/server.properties"))