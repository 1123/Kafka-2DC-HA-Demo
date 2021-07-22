for broker in 1 2 3 4; do
  kafka-configs \
    --describe \
    --entity-type brokers \
    --bootstrap-server localhost:9091,localhost:9092,localhost:9093,localhost:9094 \
    --entity-name $broker
done
