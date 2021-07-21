#!/bin/bash
mkdir /tmp/kafka3 || echo could not create data directory
kafka-server-start kafka-3.properties
