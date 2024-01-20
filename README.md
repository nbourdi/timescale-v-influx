# Time2: InfluxDB, TimescaleDB Benchmarking
[![TimescaleDB Version](https://img.shields.io/badge/timescaledb-2.13%20%7C%20PostgreSQL%2014-yellow)](https://www.timescale.com/)
[![InfluxDB Version](https://img.shields.io/badge/influx-2.7%20%7C%201.8-purple)](https://www.influxdata.com/) 

## Group 6

### 
|Team Members              |            |
|-------------------------|------------|
| Natalia Bourdi          | el19031    |
| Nikolas Stamatopoulos   | el19020    |
| George Mystriotis       | el19060    |


---

## Overview

This project aims to compare the performance of two leading time-series databases, TimescaleDB and InfluxDB, using the **Time Series Benchmarking Suite (TSBS)**. The benchmarking is conducted for both single and multi-node configurations, considering three different data sizes and two distinct use cases/database schemas. 

The experiments were conducted using Docker containers on Ubuntu Desktop Server 16.04 running on 8 CPU cores @ 2.30GHz / 16GB RAM / 90GB Storage.

---

## What was measured

- Load / insertion rates for datasets differing in size, partitioning, chunk times, and worker fleet (process parallelism)
- Query execution rates for various query types (point queries, aggregation queries, etc.), on datasets varying in partitioning

**for the below configurations**

- Single-node TimescaleDB
- Multi-node TimescaleDB (consisting of 1 access node and 3 data-bearing nodes)
- Single-node InfluxDB v1 (uses FluxQL)
- Single-node InfluxDB v2 (uses Flux)


---

## Setup and Requirements

Prerequisites: `go`, `Docker`, `docker-compose`.

1. **Clone the repository:**
   
   ```bash
   # Fetch TSBS and its dependencies
   go get github.com/timescale/tsbs
   ```
   <sup> All TSBS go programs useful for the application are included. For compatibility with Influx v2, some of the programs were tweaked. </sup>
   
2. Follow setup specific instructions
   in docs/ ....




---

## Benchmarking Configurations

### Datasets generated/used

Both use cases implemented by TSBS were used for the benchmarking process. 

1. **IoT Data from Trucks:**
   
   | Size   | Duration       | Scale           |
   |--------|-----------------|--------------------|
   | 500MB  | 2 days          | 500 trucks         |
   | 5GB    | 20 days         | 500 trucks         |
   | 25GB   | 3 months        | 500 trucks         |

 2. **DevOps Readings:**
      
   | Size   | Duration       | Scale           |
   |--------|-----------------|--------------------|
   | 500MB  | 10 days         | 50 servers         |
   | 5GB    | 20 days         | 50 servers         |
   | 25GB   | 3 months        | 50 servers         |


## Timescale configuration

### Single node database

We tested 

---

## Benchmarking Results

### Single Node Configurations

#### IoT Data from Trucks

| Database       | Dataset Size 1 | Dataset Size 2 | Dataset Size 3 |
| -------------- | -------------- | -------------- | -------------- |
| TimescaleDB    | [results]      | [results]      | [results]      |
| InfluxDB       | [results]      | [results]      | [results]      |

#### DevOps Readings from Server

| Database       | Dataset Size 1 | Dataset Size 2 | Dataset Size 3 |
| -------------- | -------------- | -------------- | -------------- |
| TimescaleDB    | [results]      | [results]      | [results]      |
| InfluxDB       | [results]      | [results]      | [results]      |

### Multinode Configurations

#### IoT Data from Trucks

| Database       | Dataset Size 1 | Dataset Size 2 | Dataset Size 3 |
| -------------- | -------------- | -------------- | -------------- |
| TimescaleDB    | [results]      | [results]      | [results]      |
| InfluxDB       | [results]      | [results]      | [results]      |

#### DevOps Readings from Server

| Database       | Dataset Size 1 | Dataset Size 2 | Dataset Size 3 |
| -------------- | -------------- | -------------- | -------------- |
| TimescaleDB    | [results]      | [results]      | [results]      |
| InfluxDB       | [results]      | [results]      | [results]      |


