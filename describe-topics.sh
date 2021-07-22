echo "describe topic test"
kafka-topics --describe \
  --topic test \
  --bootstrap-server localhost:9091,localhost:9092,localhost:9093,localhost:9094 
echo "describe topic __consumer_offsets"
kafka-topics --describe \
  --topic __consumer_offsets \
  --bootstrap-server localhost:9091,localhost:9092,localhost:9093,localhost:9094 
