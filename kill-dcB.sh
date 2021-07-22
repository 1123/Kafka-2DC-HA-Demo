#!/bin/bash

set -e -u

ZK4_PID=$(ps -ef | grep zk4 | head -n 1 | awk '{ print $2}')
ZK5_PID=$(ps -ef | grep zk5 | head -n 1 | awk '{ print $2}')
ZK6_PID=$(ps -ef | grep zk6 | head -n 1 | awk '{ print $2}')
K3_PID=$(ps -ef | grep kafka-3 | head -n 1 | awk '{ print $2}')
K4_PID=$(ps -ef | grep kafka-4 | head -n 1 | awk '{ print $2}')
PIDS="$ZK4_PID $ZK5_PID $ZK6_PID $K3_PID $K4_PID"
echo "PIDS: $PIDS"

for pid in $PIDS; do
  kill -9 $pid
done
