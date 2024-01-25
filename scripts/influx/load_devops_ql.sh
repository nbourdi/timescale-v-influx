#!/bin/bash

results_dir="results/influx/ql/load_results"

mkdir -p "${results_dir}"

datasets=("devops_h10" "devops_d4" "devops_d16")
workers=("1" "2" "4" "8")

for dataset in "${datasets[@]}"; do
  for worker in "${workers[@]}"; do
    input_file="/mnt/data/influx/data/${dataset}.gz"
    output_file="${results_dir}/influxql-w${worker}-${dataset}.txt"

    cat "${input_file}" | gunzip | \
    tsbs_load_influx --batch-size=1000 --workers="${worker}" \
      --urls="http://localhost:8087/" --do-create-db=false \
      --seed=0 \
      --results-file="${output_file}"

    echo "Completed: Workers=${worker}, Dataset=${dataset}"
  done
done
