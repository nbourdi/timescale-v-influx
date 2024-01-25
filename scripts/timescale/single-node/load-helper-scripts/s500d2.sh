#!/bin/bash

##### s500d2 ##### 

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=1  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w1_p0_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

##### workers:1 partitions:0 chunktime:variable #####

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=1  --log-batches=true \
--in-table-partition-tag=false --chunk-time=2h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w1_p0_ct_2h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=1  --log-batches=true \
--in-table-partition-tag=false --chunk-time=1h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w1_p0_ct_1h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=1  --log-batches=true \
--in-table-partition-tag=false --chunk-time=600s --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w1_p0_ct_10m_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

##### workers:1 partitions:variable #####

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=1  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w1_p2_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=2

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=1  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w1_p4_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=4

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=1  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w1_p8_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=8

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=1  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w1_p16_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=16

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=1  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w1_p32_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=32

##### workers:2 partitions:0 chunktime:variable #####

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=2  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w2_p0_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=2  --log-batches=true \
--in-table-partition-tag=false --chunk-time=2h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w2_p0_ct_2h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=2  --log-batches=true \
--in-table-partition-tag=false --chunk-time=1h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w2_p0_ct_1h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=2  --log-batches=true \
--in-table-partition-tag=false --chunk-time=600s --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w2_p0_ct_10m_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

##### workers:2 partitions:variable #####

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=2  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w2_p2_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=2

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=2  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w2_p4_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=4

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=2  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w2_p8_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=8

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=2  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w2_p16_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=16

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=2  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w2_p32_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=32


##### workers:4 partitions:0 chunktime:variable #####

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w4_p0_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4  --log-batches=true \
--in-table-partition-tag=false --chunk-time=2h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w4_p0_ct_2h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4  --log-batches=true \
--in-table-partition-tag=false --chunk-time=1h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w4_p0_ct_1h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4  --log-batches=true \
--in-table-partition-tag=false --chunk-time=600s --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w4_p0_ct_10m_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

##### workers:4 partitions:variable #####

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w4_p2_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=2

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w4_p4_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=4

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w4_p8_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=8

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w4_p16_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=16

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4 --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w4_p32_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=32



##### workers:8 partitions:0 chunktime:variable #####

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w8_p0_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=false --chunk-time=2h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w8_p0_ct_2h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=false --chunk-time=1h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w8_p0_ct_1h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=false --chunk-time=600s --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w8_p0_ct_10m_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

##### workers:2 partitions:variable #####

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w8_p2_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=2

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w8_p4_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=4

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w8_p8_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=8

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w8_p16_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=16

cat /mnt/data/timescale/data/s500d2.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/load-benchmarks-500/s500d2/w8_p32_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000 --partitions=32