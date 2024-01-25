tsbs_generate_data --use-case="devops" --seed=0 --scale=50\
    --timestamp-start="2024-01-01T00:00:00Z" \
    --timestamp-end="2024-01-01T10:00:00Z" \
    --log-interval="10s" --format="influx" \
    | gzip > /mnt/data/influx/data/devops_h10.gz

tsbs_generate_data --use-case="devops" --seed=0 --scale=50\
    --timestamp-start="2024-01-01T00:00:00Z" \
    --timestamp-end="2024-01-04T08:00:00Z" \
    --log-interval="10s" --format="influx" \
    | gzip > /mnt/data/influx/data/devops_d4.gz

tsbs_generate_data --use-case="devops" --seed=0 --scale=50\
    --timestamp-start="2024-01-01T00:00:00Z" \
    --timestamp-end="2024-01-16T13:00:00Z" \
    --log-interval="10s" --format="influx" \
    | gzip > /mnt/data/influx/data/devops_d16.gz

tsbs_generate_data --use-case="devops" --seed=0 --scale=50\
    --timestamp-start="2024-01-01T00:00:00Z" \
    --timestamp-end="2024-01-01T10:00:00Z" \
    --log-interval="10s" --format="timescaledb" \
    | gzip > /mnt/data/timescale/data/devops_h10.gz

tsbs_generate_data --use-case="devops" --seed=0 --scale=50\
    --timestamp-start="2024-01-01T00:00:00Z" \
    --timestamp-end="2024-01-04T08:00:00Z" \
    --log-interval="10s" --format="timescaledb" \
    | gzip > /mnt/data/timescale/data/devops_d4.gz

tsbs_generate_data --use-case="devops" --seed=0 --scale=50\
    --timestamp-start="2024-01-01T00:00:00Z" \
    --timestamp-end="2024-01-16T13:00:00Z" \
    --log-interval="10s" --format="timescaledb" \
    --interleaved-generation-groups=8 \
    | gzip > /mnt/data/timescale/data/devops_d16.gz

tsbs_generate_data --use-case="iot" --seed=0 --scale=500\
    --timestamp-start="2024-01-01T00:00:00Z" \
    --timestamp-end="2024-01-03T00:00:00Z" \
    --log-interval="60s" --format="influx" \
    | gzip > /mnt/data/influx/data/s500d2.gz

tsbs_generate_data --use-case="iot" --seed=0 --scale=500\
    --timestamp-start="2024-01-01T00:00:00Z" \
    --timestamp-end="2024-01-21T00:00:00Z" \
    --log-interval="60s" --format="influx" \
    | gzip > /mnt/data/influx/data/s500d20.gz

tsbs_generate_data --use-case="iot" --seed=0 --scale=500\
    --timestamp-start="2024-01-01T00:00:00Z" \
    --timestamp-end="2024-04-10T00:00:00Z" \
    --log-interval="60s" --format="influx" \
    | gzip > /mnt/data/influx/data/s500m3.gz

tsbs_generate_data --use-case="iot" --seed=0 --scale=500\
    --timestamp-start="2024-01-01T00:00:00Z" \
    --timestamp-end="2024-01-03T00:00:00Z" \
    --log-interval="60s" --format="timescaledb" \
    | gzip > /mnt/data/timescale/data/s500d2.gz

tsbs_generate_data --use-case="iot" --seed=0 --scale=500\
    --timestamp-start="2024-01-01T00:00:00Z" \
    --timestamp-end="2024-01-21T00:00:00Z" \
    --log-interval="60s" --format="timescaledb" \
    | gzip > /mnt/data/timescale/data/s500d20.gz

tsbs_generate_data --use-case="iot" --seed=0 --scale=500\
    --timestamp-start="2024-01-01T00:00:00Z" \
    --timestamp-end="2024-04-10T00:00:00Z" \
    --log-interval="60s" --format="timescaledb" \
    | gzip > /mnt/data/timescale/data/s500m3.gz


