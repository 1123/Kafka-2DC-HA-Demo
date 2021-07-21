kafka-configs \
  --alter \
  --entity-type brokers \
  --bootstrap-server localhost:9091,localhost:9092,localhost:9093,localhost:9094 \
  --entity-name 1 \
  --add-config min.insync.replicas=3
kafka-configs \
  --alter \
  --entity-type brokers \
  --bootstrap-server localhost:9091,localhost:9092,localhost:9093,localhost:9094 \
  --entity-name 2 \
  --add-config min.insync.replicas=3
