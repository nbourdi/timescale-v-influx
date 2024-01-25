#!/bin/bash

mkdir -p ../../results/timescale/single-node/load-benchmarks/s500m3
##### s500m3 ##### 

cat ../../data/timescale/data/s500m3.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=1  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="../../results/timescale/single-node/load-benchmarks/s500m3/w1_p0_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat ../../data/timescale/data/s500m3.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=2  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="../../results/timescale/single-node/load-benchmarks/s500m3/w2_p0_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

##### workers:4 partitions:0 chunktime:variable #####

cat ../../data/timescale/data/s500m3.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="../../results/timescale/single-node/load-benchmarks/s500m3/w4_p0_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat ../../data/timescale/data/s500m3.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4  --log-batches=true \
--in-table-partition-tag=false --chunk-time=2h --results-file="../../results/timescale/single-node/load-benchmarks/s500m3/w4_p0_ct_2h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat ../../data/timescale/data/s500m3.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4  --log-batches=true \
--in-table-partition-tag=false --chunk-time=1h --results-file="../../results/timescale/single-node/load-benchmarks/s500m3/w4_p0_ct_1h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat ../../data/timescale/data/s500m3.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4  --log-batches=true \
--in-table-partition-tag=false --chunk-time=600s --results-file="../../results/timescale/single-node/load-benchmarks/s500m3/w4_p0_ct_10m_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

##### workers:4 partitions:variable #####

cat ../../data/timescale/data/s500m3.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="../../results/timescale/single-node/load-benchmarks/s500m3/w4_p2_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=2

cat ../../data/timescale/data/s500m3.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="../../results/timescale/single-node/load-benchmarks/s500m3/w4_p4_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=4

cat ../../data/timescale/data/s500m3.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="../../results/timescale/single-node/load-benchmarks/s500m3/w4_p8_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=8

cat ../../data/timescale/data/s500m3.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="../../results/timescale/single-node/load-benchmarks/s500m3/w4_p16_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=16

cat ../../data/timescale/data/s500m3.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4 --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="../../results/timescale/single-node/load-benchmarks/s500m3/w4_p32_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=32



##### workers:8 partitions:0 chunktime:variable #####

cat ../../data/timescale/data/s500m3.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="../../results/timescale/single-node/load-benchmarks/s500m3/w8_p0_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat ../../data/timescale/data/s500m3.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=false --chunk-time=2h --results-file="../../results/timescale/single-node/load-benchmarks/s500m3/w8_p0_ct_2h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat ../../data/timescale/data/s500m3.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=false --chunk-time=1h --results-file="../../results/timescale/single-node/load-benchmarks/s500m3/w8_p0_ct_1h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat ../../data/timescale/data/s500m3.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=false --chunk-time=600s --results-file="../../results/timescale/single-node/load-benchmarks/s500m3/w8_p0_ct_10m_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

##### workers:2 partitions:variable #####

cat ../../data/timescale/data/s500m3.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="../../results/timescale/single-node/load-benchmarks/s500m3/w8_p2_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=2

cat ../../data/timescale/data/s500m3.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="../../results/timescale/single-node/load-benchmarks/s500m3/w8_p4_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=4

cat ../../data/timescale/data/s500m3.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="../../results/timescale/single-node/load-benchmarks/s500m3/w8_p8_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=8

cat ../../data/timescale/data/s500m3.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="../../results/timescale/single-node/load-benchmarks/s500m3/w8_p16_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=16

cat ../../data/timescale/data/s500m3.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="../../results/timescale/single-node/load-benchmarks/s500m3/w8_p32_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=32