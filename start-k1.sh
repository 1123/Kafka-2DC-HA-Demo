#!/bin/bash
mkdir /tmp/kafka1 || echo could not create data directory
kafka-server-start kafka-1.properties
