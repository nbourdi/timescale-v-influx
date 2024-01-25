#!/bin/bash

mkdir -p /home/user/timescale-setup/multi-node/load-benchmarks-500/devops_d4

##### devops_d4 ##### 

#cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
#--host="localhost" --port=5432 --pass="postgres" \
#--user="postgres"  --workers=1  --log-batches=true \
#--in-table-partition-tag=true --replication-factor=1 --chunk-time=8h --results-file="/home/user/timescale-setup/multi-node/load-benchmarks-500/devops_d4/w1_p0_ct_8h_bs100k.txt" \
#--field-index-count=1 --do-create-db=false --force-text-format=false \
#--do-abort-on-exist=false --seed=0 --batch-size=100000

##### workers:1 partitions:0 chunktime:variable #####

cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=1  --log-batches=true \
--in-table-partition-tag=true --replication-factor=1 --chunk-time=2h --results-file="/home/user/timescale-setup/multi-node/load-benchmarks-500/devops_d4/w1_p0_ct_2h_bs100k.txt" \
--field-index-count=1 --do-create-db=false --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=1  --log-batches=true \
--in-table-partition-tag=true --replication-factor=1 --chunk-time=1h --results-file="/home/user/timescale-setup/multi-node/load-benchmarks-500/devops_d4/w1_p0_ct_1h_bs100k.txt" \
--field-index-count=1 --do-create-db=false --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

##### workers:2 partitions:0 chunktime:variable #####

cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=2  --log-batches=true \
--in-table-partition-tag=true --replication-factor=1 --chunk-time=8h --results-file="/home/user/timescale-setup/multi-node/load-benchmarks-500/devops_d4/w2_p0_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=false --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=2  --log-batches=true \
--in-table-partition-tag=true --replication-factor=1 --chunk-time=2h --results-file="/home/user/timescale-setup/multi-node/load-benchmarks-500/devops_d4/w2_p0_ct_2h_bs100k.txt" \
--field-index-count=1 --do-create-db=false --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=2  --log-batches=true \
--in-table-partition-tag=true --replication-factor=1 --chunk-time=1h --results-file="/home/user/timescale-setup/multi-node/load-benchmarks-500/devops_d4/w2_p0_ct_1h_bs100k.txt" \
--field-index-count=1 --do-create-db=false --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

##### workers:4 partitions:0 chunktime:variable #####

cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4  --log-batches=true \
--in-table-partition-tag=true --replication-factor=1 --chunk-time=8h --results-file="/home/user/timescale-setup/multi-node/load-benchmarks-500/devops_d4/w4_p0_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=false --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4  --log-batches=true \
--in-table-partition-tag=true --replication-factor=1 --chunk-time=2h --results-file="/home/user/timescale-setup/multi-node/load-benchmarks-500/devops_d4/w4_p0_ct_2h_bs100k.txt" \
--field-index-count=1 --do-create-db=false --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=4  --log-batches=true \
--in-table-partition-tag=true --replication-factor=1 --chunk-time=1h --results-file="/home/user/timescale-setup/multi-node/load-benchmarks-500/devops_d4/w4_p0_ct_1h_bs100k.txt" \
--field-index-count=1 --do-create-db=false --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000



##### workers:8 partitions:0 chunktime:variable #####

cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=true --replication-factor=1 --chunk-time=8h --results-file="/home/user/timescale-setup/multi-node/load-benchmarks-500/devops_d4/w8_p0_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=false --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=true --replication-factor=1 --chunk-time=2h --results-file="/home/user/timescale-setup/multi-node/load-benchmarks-500/devops_d4/w8_p0_ct_2h_bs100k.txt" \
--field-index-count=1 --do-create-db=false --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=true --replication-factor=1 --chunk-time=1h --results-file="/home/user/timescale-setup/multi-node/load-benchmarks-500/devops_d4/w8_p0_ct_1h_bs100k.txt" \
--field-index-count=1 --do-create-db=false --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000
