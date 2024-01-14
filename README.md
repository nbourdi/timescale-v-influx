# Time2: InfluxDB, TimescaleDB Benchmarking

## Team 6

### Team Members:
- Natalia Bourdi [el19031]
- Nikolas Stamatopoulos [el19020]
- George Mystriotis [el19060]

---

## Overview

This project aims to compare the performance of two leading time-series databases, TimescaleDB and InfluxDB, using the Time Series Benchmarking Suite (TSBS). The benchmarking is conducted for both single and multi-node configurations, considering three different data sizes and two distinct use cases/database schemas. 
The experiments were conducted using Docker containers on Ubuntu Desktop Server 16.04 running on 8 CPU cores / 16GB RAM / 90GB Storage.

---

## Setup and Requirements

Prerequisites: `go`, `Docker`, `docker-compose`.

1. **Clone the TSBS repository:**
   ```bash
   # Fetch TSBS and its dependencies
   go get github.com/timescale/tsbs
2. ** Replace go programs???????????? **
   cd $GOPATH/src/github.com/timescale/tsbs




---

## Benchmarking Configurations

### Single Node Configurations

1. **IoT Data from Trucks:**
   - Dataset Size 1
   - Dataset Size 2
   - Dataset Size 3

2. **DevOps Readings from Server:**
   - Dataset Size 1
   - Dataset Size 2
   - Dataset Size 3

### Multinode Configurations

1. **IoT Data from Trucks:**
   - Dataset Size 1
   - Dataset Size 2
   - Dataset Size 3

2. **DevOps Readings from Server:**
   - Dataset Size 1
   - Dataset Size 2
   - Dataset Size 3

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


