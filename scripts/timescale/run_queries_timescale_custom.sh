#!/bin/bash

# Default values
base_dir="../../data/timescale/queries"
partitions=0
chunk_time="2h"

while getopts ":d:m:p:c:" opt; do
  case $opt in
    d) dir="$OPTARG";;
    p) partitions="$OPTARG";;
    m) mode="$OPTARG";;
    \?) echo "Invalid option: -$OPTARG" >&2; exit 1;;
    :) echo "Option -$OPTARG requires an argument." >&2; exit 1;;
  esac
done

input_dir="${base_dir}/${dir}"
output_dir="${base_dir}/${mode}/${dir}"

mkdir -p ${output_dir}

# Check if there are any files matching the pattern
shopt -s nullglob
files=("${input_dir}"/*.gz)
shopt -u nullglob

if [ ${#files[@]} -eq 0 ]; then
  echo "No files found matching the pattern: ${input_dir}/*.gz"
  exit 1
fi

# Loop through input files
for input_file in "${files[@]}"; do

    # Extract file name without extension
    file_name=$(basename "${input_file}" .gz)

    echo "Processing: ${input_file}"

    # Output file for query results
    
    output_file="${output_dir}/${file_name}_p${partitions}_ct_${chunk_time}.json"

    cat ${input_file} | gunzip | tsbs_run_queries_timescaledb --workers=8 --postgres="host=localhost user=postgres sslmode=disable" --results-file="${output_file}" --pass=postgres --prewarm-queries=true

    echo "Processed: ${input_file} -> ${output_file}"
done
