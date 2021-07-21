#!/bin/bash
mkdir /tmp/kafka2 || echo could not create data directory
kafka-server-start kafka-2.properties
