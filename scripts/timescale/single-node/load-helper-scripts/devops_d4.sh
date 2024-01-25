#!/bin/bash

##### devops_d4 ##### 

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=1  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w1_p0_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true

# ##### workers:1 partitions:0 chunktime:variable #####

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=1  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=2h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w1_p0_ct_2h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=1  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=1h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w1_p0_ct_1h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true

#  cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# # --host="localhost" --port=5432 --pass="postgres" \
# # --user="postgres"  --workers=1  --log-batches=false \
# # --in-table-partition-tag=false --chunk-time=600s --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w1_p0_ct_10m_bs100k.txt" \
# # --field-index-count=1 --do-create-db=true --force-text-format=false \
# # --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true

# ##### workers:1 partitions:variable #####

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=1  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w1_p2_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true --partitions=2

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=1  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w1_p4_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true --partitions=4

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=1  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w1_p8_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true --partitions=8

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=1  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w1_p16_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true --partitions=16

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=1  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w1_p32_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true --partitions=32

##### workers:2 partitions:0 chunktime:variable #####

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=2  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w2_p0_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=2  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=2h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w2_p0_ct_2h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=2  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=1h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w2_p0_ct_1h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=2  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=600s --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w2_p0_ct_10m_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true

##### workers:2 partitions:variable #####

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=2  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w2_p2_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true --partitions=2

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=2  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w2_p4_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true --partitions=4

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=2  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w2_p8_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true --partitions=8

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=2  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w2_p16_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true --partitions=16

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=2  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w2_p32_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true --partitions=32


##### workers:4 partitions:0 chunktime:variable #####

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=4  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w4_p0_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=4  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=2h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w4_p0_ct_2h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=4  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=1h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w4_p0_ct_1h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=4  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=600s --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w4_p0_ct_10m_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true

##### workers:4 partitions:variable #####

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=4  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w4_p2_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true --partitions=2

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=4  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w4_p4_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true --partitions=4

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=4  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w4_p8_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true --partitions=8

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=4  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w4_p16_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true --partitions=16

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=4 --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w4_p32_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true --partitions=32



##### workers:8 partitions:0 chunktime:variable #####

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=8  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w8_p0_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=8  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=2h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w8_p0_ct_2h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true

cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=false \
--in-table-partition-tag=false --chunk-time=1h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w8_p0_ct_1h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true

# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=8  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=600s --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w8_p0_ct_10m_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true

##### workers:8 partitions:variable #####

cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=false \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w8_p2_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true --partitions=2

./run_queries_timescale_custom.sh -d devops_d4 -p 2 -c 8h 


cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=false \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w8_p4_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true --partitions=4

cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=false \
--in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w8_p8_ct_8h_bs100k.txt" \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true --partitions=8


# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=8  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w8_p16_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true --partitions=16


# cat /mnt/data/timescale/data/devops_d4.gz | gunzip | tsbs_load_timescaledb \
# --host="localhost" --port=5432 --pass="postgres" \
# --user="postgres"  --workers=8  --log-batches=false \
# --in-table-partition-tag=false --chunk-time=8h --results-file="/home/user/timescale-setup/single-node/cpu-load-benchmarks-500/devops_d4/w8_p32_ct_8h_bs100k.txt" \
# --field-index-count=1 --do-create-db=true --force-text-format=false \
# --do-abort-on-exist=false --seed=0 --batch-size=10000 --use-insert=true --partitions=32