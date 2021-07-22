## Prerequisites

* A recent version of Confluent Platform installed
* Linux or MacOS operating system 
* bash and `awk` command line tool. 
* A recent version of Java 

## How to run this demo

1. Startup the Zookeeper Hierarchical Quorum, each process in a different terminal window. 
While not all processes are running, you will see exceptions in the logs, which is fine. 
Once all processes are running, no additional exceptions should be logged. 
    1. `./start-zk-1.sh`
    1. `./start-zk-2.sh`
    1. `./start-zk-3.sh`
    1. `./start-zk-4.sh`
    1. `./start-zk-5.sh`
    1. `./start-zk-6.sh`
2. Inspect the Zookeeper cluster status: `./get-zookeeper-cluster-status.sh`. 
  You should see that all Zookeeper nodes are running, and there is exactly one leader and 5 followers. 
3. Kill Zookeeper1 and Zookeeper4: `kill -9 <PROCESS_ID>` to simulate machine failures. 
  Again inspect the Zookeeper cluster status and see that there are 4 Zookeepers running, exactly one leader and 3 followers. The cluster is still operational, since it tolerates one outage per Zookeeper group.
4. Restart Zookeeper1 and Zookeeper4. The cluster is now back in normal state. 
5. Start the Kafka brokers in four additional terminal windows.
   You will see exceptions in the logs as long as not all brokers are running. 
   Once all brokers are up, no additional exceptions should be logged. 
   You now have a fully functional cluster up and running that simulates a stretched cluster over two data centers. 
   1. ./start-k1.sh
   1. ./start-k2.sh
   1. ./start-k3.sh
   1. ./start-k4.sh
6. Start a sample producer and a sample consumer application in two more terminal windows. 
   Note that the producer is configured with the `acks=all` setting. 
   This will create the topics `test` and `__consumer_offsets`.
   1. `./run-producer.sh`
   2. `./run-consumer.sh`
7. Inspect the newly created topics: `./describe-topics.sh`. 
   Note that both topics have replication factor 4 and `min.insync.replicas` configuration of 3. 
8. Kill one broker to simulate a machine failure: `kill -9 <PROCESS_ID>` . 
   Note that the producer and consumer continue operating without errors. 
9. Kill another broker to simulate another machine failure.
   You should see that the producer is no longer able to produce, since the `min.insync.replicas` setting is no longer fulfilled. 
   This shows that the setup tolerates the outage of one broker, but not two.
10. Restart the two brokers to bring back the cluster in normal mode. 
11. Kill all processes located in DataCenter B -- these are Zookeeper 4 5 and 6, as well as Kafka 3 and 4: `./kill-dcB.sh`.
    Notice that neither the producer nor the consumer are working. 
12. Bring Zookeeper to reduced operational mode: 
    1. Stop all remaining Zookeeper nodes.
    2. Start Zookeper in simple quorum mode: 
        1. './start-zk-1-degraded.sh'
        2. './start-zk-2-degraded.sh'
        3. './start-zk-3-degraded.sh'
13. Bring Kafka to reduced operational mode. 
    Reduce the min.insync.replicas setting for the remaining brokers: `./reduce-min-isr-dc-A.sh`. 
    Note that the producer and consumer are now again functional. 
    In this reduced operational mode we can still tolerate the outage of another Kafka broker and another Zookeeper node. 
14. Bring Zookeeper 4 to 6 and Kafka 3 and 4 back online. 
    Inspect the Zookeeper cluster status and note that only Zookeeper 1 to 3 are currently serving requests. 
15. Increase the min.insync.replicas` setting back to 3: `./increase-min-isr-dc-A.sh`. `
    In production you should only do this once there are no more under-replicated partitions. 
    This check should be automated. 
    Note that this does not impact the producer or consumer, since there are sufficient insync replicas present. 
16. Bring back Zookeeper to the hierarchical quorum mode by restarting Zookeeper 1 to 3. This will not impact the producer or consumer. 
    1. `./start-zk-1.sh`
    1. `./start-zk-2.sh`
    1. `./start-zk-3.sh`
17. Check the Zookeeper cluster status to see that all nodes are back serving requests.  
18. Stop all processes and run the cleanup script: `cleanup.sh`.
