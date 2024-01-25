#!/bin/bash

base_path="../../data/influx/queries/devops_h10"

under_10h_queries=("single-groupby-1-1-1" "single-groupby-1-8-1" "single-groupby-5-1-1" "single-groupby-5-8-1" "cpu-max-all-1" "cpu-max-all-8" "groupby-orderby-limit" "lastpoint")

mkdir -p "$base_path"

for query_type in "${under_10h_queries[@]}"; do
    tsbs_generate_queries --use-case="devops" --seed=0 --scale=50 \
        --timestamp-start="2024-01-01T00:00:00Z" \
        --timestamp-end="2024-01-01T10:00:01Z" \
        --queries=50 --format="influx" --query-type="$query_type" \
        | gzip > "$base_path/$query_type.gz"
done

base_path="../..//data/influx/queries/devops_d4"

mkdir -p "$base_path"

queries=("single-groupby-1-1-1" "single-groupby-1-1-12" "single-groupby-1-8-1" "single-groupby-5-1-1" "single-groupby-5-1-12" "single-groupby-5-8-1" "cpu-max-all-1" "cpu-max-all-8" "double-groupby-1" "double-groupby-5" "double-groupby-all" "high-cpu-all" "high-cpu-1" "groupby-orderby-limit" "lastpoint")

for query_type in "${queries[@]}"; do
    tsbs_generate_queries --use-case="devops" --seed=0 --scale=50 \
        --timestamp-start="2024-01-01T00:00:00Z" \
        --timestamp-end="2024-01-04T08:00:01Z" \
        --queries=50 --format="influx" --query-type="$query_type" \
        | gzip > "$base_path/$query_type.gz"
done

base_path="../../data/influx/queries/devops_d16"

mkdir -p "$base_path"

for query_type in "${queries[@]}"; do
    tsbs_generate_queries --use-case="devops" --seed=0 --scale=50 \
        --timestamp-start="2024-01-01T00:00:00Z" \
        --timestamp-end="2024-01-16T13:00:01Z" \
        --queries=50 --format="influx" --query-type="$query_type" \
        | gzip > "$base_path/$query_type.gz"
done
