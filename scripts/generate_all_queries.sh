#!/bin/bash

# Use this script to generate all queries at once
# Make sure you've given +x permission to all the bellow scripts

./timescale/timescale_iot_all_queries_generate.sh
./timescale/timescale_devops_all_queries_generate.sh
./influx/influx_iot_all_queries_generate.sh
./influx/influx_devops_all_queries_generate.sh