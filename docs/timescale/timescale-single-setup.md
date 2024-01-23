1. **Build and start the TimescaleDB instance.**

    ```bash
    docker-compose -f /home/user/timescale-setup/multi-node/timescale-single.yml up
    ```

2. **Replace the configuration file.**
  
    ```bash
    docker cp postgresql.conf timescaledb-single:/var/lib/postgresql/data/postgresql.conf
    ```

   This takes care of any authentication issues and incompatibilities.
    
3. Restart to load the updated config files.

    ```bash
    docker restart timescaledb-single
    ```
