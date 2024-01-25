## InfluxQL 

1. **Build and start the instance**

```bash
docker-compose -f docker-compose/influxql.yml up
```
2. **Run the load benchmark**

```bash
./scripts/influx/load_devops_ql.sh
./scripts/influx/load_iot_ql.sh
```
After completion, results should appear in
results/influx/fluxql/load_results

3. **Benchmark queries**

- Load a dataset

```bash
cat <input_file>.gz | gunzip | \
    tsbs_load_influx --batch-size=1000 --workers=8 \
      --urls="http://localhost:8087" --do-create-db=false \
      --seed=0 
```

input_file can be any iot/devops dataset you generated (s500d2, s500d20 etc.)

```bash
./scripts/influx/run_queries_influx_custom.sh -d <dir> -l ql
```

\<dir> should be the same as the input file name

After completion, results should appear in
results/influx/queries/ql/results/\<dir>_results

---

## Flux 
1. **Build and start the instance**
```bash
docker-compose -f docker-compose/influx.yml up
```
2. **Run the load benchmark**

```bash
./scripts/influx/load_devops.sh
./scripts/influx/load_iot.sh
```
After completion, results should appear in
results/influx/flux/load_results

3. **Benchmark queries**

- Load a dataset

```bash
cat <input_file>.gz | gunzip | \
    tsbs_load_influx --batch-size=1000 --workers=8 \
      --urls="http://localhost:8087" --do-create-db=false \
      --seed=0 
```

input_file can be any iot/devops dataset you generated (s500d2, s500d20 etc.)

```bash
./scripts/influx/run_queries_influx_custom.sh -d <dir> -l flux
```

\<dir> should be the same as the input file name

After completion, results should appear in
results/influx/queries/flux/results/\<dir>_results

---