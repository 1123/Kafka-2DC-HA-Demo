#!/bin/bash
mkdir /tmp/kafka4 || echo could not create data directory
kafka-server-start kafka-4.properties
