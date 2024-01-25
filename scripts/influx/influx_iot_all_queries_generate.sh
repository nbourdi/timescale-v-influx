#!/bin/bash

queries=("high-load" "stationary-trucks" "last-loc" "breakdown-frequency" "avg-load" "avg-daily-driving-duration" "avg-vs-projected-fuel-consumption" "long-driving-sessions" "low-fuel" "single-last-loc" "daily-activity" "long-daily-sessions")

base_path="/mnt/data/influx/queries/s500d2"

mkdir -p $base_path

for query_type in "${queries[@]}"; do
    tsbs_generate_queries --use-case="iot" --seed=0 --scale=500 \
        --timestamp-start="2024-01-01T00:00:00Z" \
        --timestamp-end="2024-01-03T00:00:01Z" \
        --queries=50 --format="influx" --query-type="$query_type" \
        | gzip > "$base_path/$query_type.gz"
done

base_path="/mnt/data/influx/queries/s500d20"

mkdir -p $base_path

for query_type in "${queries[@]}"; do
    tsbs_generate_queries --use-case="iot" --seed=0 --scale=500 \
    --timestamp-start="2024-01-01T00:00:00Z" \
    --timestamp-end="2024-01-21T00:00:01Z" \
        --queries=50 --format="influx" --query-type="$query_type" \
        | gzip > "$base_path/$query_type.gz"
done

base_path="/mnt/data/influx/queries/s500m3"

mkdir -p $base_path

for query_type in "${queries[@]}"; do
    tsbs_generate_queries --use-case="iot" --seed=0 --scale=500 \
    --timestamp-start="2024-01-01T00:00:00Z" \
    --timestamp-end="2024-04-10T00:00:01Z" \
        --queries=50 --format="influx" --query-type="$query_type" \
        | gzip > "$base_path/$query_type.gz"
done