# Timescale single-node

1. **Build and start the TimescaleDB instance.**

    ```bash
    docker-compose -f docker-compose/timescale-single.yml up
    ```

2. **Replace the configuration file.**
  
    ```bash
    docker cp config-files/postgresql.conf timescaledb-single:/var/lib/postgresql/data/postgresql.conf
    ```

   This takes care of any authentication issues and incompatibilities.
    
3. **Restart to load the updated config files.**

    ```bash
    docker restart timescaledb-single
    ```

Now you should be ready to start benchmarking.

4. **Benchmark inserts/loads**

In the project's main directory, execute:

```bash
./scripts/timescale/load_all_timescale_single.sh
```


5. **Benchmark query execution**
- Load a dataset. 

Here's an example load. 
```bash
cat <input_file>.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=false --chunk-time=8h  \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

```
input_file can be any iot/devops dataset you generated (s500d2, s500d20 etc.)

Now run the query benchmark.

```bash
./scripts/timescale/run_queries_timescale_custom.sh -d <dir> -m single-node -c <chunk_time> -p <partitions>
```
Chunk time, partition and dir should be the same as the load parameters.

-----

# Timescale multi-node


1. **Build and start the TimescaleDB cluster [1 access node and 3 data nodes].**

    ```bash
    docker-compose -f docker-compose/timescale-cluster.yml up
    ```

2. **Create a database "benchmark" and configure container `ts-an` to be the cluster's access node.**

    ```bash
    docker exec -it ts-an bash
    psql -U postgres
    CREATE DATABASE benchmark;
    exit
    psql -U postgres -d benchmark
    ```

    Add the data nodes.

    ```sql
    SELECT add_data_node('dn1', host => '83.212.81.182', port => '5433', password => 'postgres');
    SELECT add_data_node('dn2', host => '83.212.81.182', port => '5434', password => 'postgres');
    SELECT add_data_node('dn3', host => '83.212.81.182', port => '5435', password => 'postgres');
    ```

3. **Replace the configuration files on all four nodes.**

    Exit the container.

    ```bash
    cd config-files
    docker cp access.conf ts-an:/var/lib/postgresql/data/postgresql.conf
    docker cp data.conf ts-dn1:/var/lib/postgresql/data/postgresql.conf
    docker cp data.conf ts-dn2:/var/lib/postgresql/data/postgresql.conf
    docker cp data.conf ts-dn3:/var/lib/postgresql/data/postgresql.conf
    
    docker cp passfile ts-an:/var/lib/postgresql/data/passfile
    
    docker cp hba_data.conf ts-dn1:/var/lib/postgresql/data/pg_hba.conf
    docker cp hba_data.conf ts-dn2:/var/lib/postgresql/data/pg_hba.conf
    docker cp hba_data.conf ts-dn3:/var/lib/postgresql/data/pg_hba.conf
    cd ../
    ```

    Restart the docker containers to load the updated config files.

    ```bash
    docker restart ts-an ts-dn1 ts-dn2 ts-dn3
    docker exec -it ts-an bash
    chmod 0600 /var/lib/postgresql/data/passfile
    ```

4. **Authentication setup.**

    In the access node.

    ```bash
    psql -U postgres -d benchmark
    CREATE ROLE testrole;
    CALL distributed_exec($$ CREATE ROLE testrole PASSWORD 'postgres' LOGIN $$);
    GRANT USAGE ON FOREIGN SERVER dn1, dn2, dn3 TO testrole;
    exit
    exit
    ```

    Restart containers.

    ```bash
    docker restart ts-an ts-dn1 ts-dn2 ts-dn3
    ```

Now you should be ready to benchmark!

4. **Benchmark inserts/loads**

In the project's main directory, execute:

```bash
./scripts/timescale/load_all_timescale_multi.sh
```

5. **Benchmark query execution**
- Load a dataset. 

Here's an example load. 
```bash
cat <input_file>.gz | gunzip | tsbs_load_timescaledb \
--host="localhost" --port=5432 --pass="postgres" \
--user="postgres"  --workers=8  --log-batches=true \
--in-table-partition-tag=true --replication-factor=1 --chunk-time=8h \
--field-index-count=1 --do-create-db=false --force-text-format=false \
--do-abort-on-exist=false --seed=0 --batch-size=100000

```
input_file can be any iot/devops dataset you generated (s500d2, s500d20 etc.)

Now run the query benchmark.

```bash
./scripts/timescale/run_queries_timescale_custom.sh -d <dir> -m multi-node -c <chunk_time> 
```
Chunk time and dir (same as input_file) should be the same as the load parameters.
