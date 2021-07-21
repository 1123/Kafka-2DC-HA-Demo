mkdir /tmp/zk1
echo 1 > /tmp/zk1/myid
zookeeper-server-start zk1-degraded.properties
