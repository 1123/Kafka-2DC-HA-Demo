kafka-producer-perf-test \
  --throughput 10 \
  --record-size 1024 \
  --num-records 200 \
  --topic test \
  --producer-props \
    bootstrap.servers=localhost:9091,localhost:9092,localhost:9093,localhost:9094 \
    acks=-1
