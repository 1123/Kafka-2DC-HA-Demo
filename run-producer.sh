kafka-producer-perf-test \
  --throughput 10 \
  --record-size 1024 \
  --num-records 20000000 \
  --topic test \
  --producer.config producer.config 
