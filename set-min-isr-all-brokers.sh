for broker in 1 2 3 4; do
  kafka-configs \
    --alter \
    --entity-type brokers \
    --bootstrap-server localhost:9091,localhost:9092,localhost:9093,localhost:9094 \
    --entity-name $broker \
    --add-config min.insync.replicas=3
done
