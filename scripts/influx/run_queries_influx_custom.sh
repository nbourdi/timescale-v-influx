#!/bin/bash

base_dir="results/influx/queries"

while getopts ":d:l:" opt; do
  case $opt in
    d) dir="$OPTARG";;
    l) lang="$OPTARG";;
    \?) echo "Invalid option: -$OPTARG" >&2; exit 1;;
    :) echo "Option -$OPTARG requires an argument." >&2; exit 1;;
  esac
done

input_dir="${base_dir}/${dir}"
output_dir="${base_dir}/${lang}/${dir}_results"

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
    
    output_file="${output_dir}/${file_name}.json"

    cat ${input_file} | gunzip | tsbs_run_queries_influx \
        --db-name="benchmark" --urls="http://localhost:8087" \
        --workers=8 --prewarm-queries=true --results-file="${output_file}"
    echo "Processed: ${input_file} -> ${output_file}"
done
