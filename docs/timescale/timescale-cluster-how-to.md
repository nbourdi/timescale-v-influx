1. **Build and start the TimescaleDB cluster [1 access node and 3 data nodes].**

    ```bash
    docker-compose -f /home/user/timescale-setup/multi-node/timescale-cluster.yml up
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
    docker cp access.conf ts-an:/var/lib/postgresql/data/postgresql.conf
    docker cp data.conf ts-dn1:/var/lib/postgresql/data/postgresql.conf
    docker cp data.conf ts-dn2:/var/lib/postgresql/data/postgresql.conf
    docker cp data.conf ts-dn3:/var/lib/postgresql/data/postgresql.conf
    
    docker cp passfile ts-an:/var/lib/postgresql/data/passfile
    
    docker cp hba_data.conf ts-dn1:/var/lib/postgresql/data/pg_hba.conf
    docker cp hba_data.conf ts-dn2:/var/lib/postgresql/data/pg_hba.conf
    docker cp hba_data.conf ts-dn3:/var/lib/postgresql/data/pg_hba.conf
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

5. **Benchmark.**

    ```bash
    cat /home/user/timescaledb-coquette.gz | gunzip | tsbs_load_timescaledb --host="localhost" --port=5450 --pass="postgres" --replication-factor=1 --user="postgres"  --workers=8  --in-table-partition-tag=true --chunk-time=24h  --field-index-count=1 --do-create-db=false --force-text-format=false --do-abort-on-exist=false --in-table-partition-tag=true
    ```
