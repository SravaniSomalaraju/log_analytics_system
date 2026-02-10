# Log Analytics System using Hadoop
## Project Overview

This project implements a distributed log analytics system using Hadoop to process large-scale web access logs. The objective is to evaluate Hadoop’s scalability, fault tolerance, and distributed processing capabilities through HDFS storage, MapReduce execution, Python streaming, and performance tuning.

### Dataset: https://www.kaggle.com/datasets/avinhok/website-log-access


## Technologies Used

- Hadoop (HDFS, YARN, MapReduce)
- Python (Hadoop Streaming)
- Shell Scripting
- Regular Expressions
- WSL
- Git & GitHub

## Project Structure
```
log_analytics_system/
│
├── source/
│   ├── architecture.txt
│   ├── large_log_file.sh
│   ├── setup.sh
│   ├── small_log_file.sh
│   ├── start_hadoop.sh
│   └── word_count.sh
│
├── custom_mapreduce/
│   ├── error_mapper.py
│   ├── mapper.py
│   ├── reducer.py
│   ├── phase4_run_streaming.sh
│   └── phase5_run_streaming.sh
│
├── .gitignore
├── project_notes.txt
└── README.md
```

## Phase 1 - Hadoop Environment Setup

Configured a pseudo-distributed Hadoop cluster and verified:
- HDFS running
- YARN running
- MapReduce execution successful
- Hadoop Web UI accessible
Scripts used:
source/setup.sh
source/start_hadoop.sh


## Phase 2 — Log Ingestion and Block Analysis
### Small Log File
- Uploaded log file to HDFS
- Observed block allocation behavior
- Identified inefficiency of small files
Script:
source/small_log_file.sh
### Large Log File Scalability
- Generated large log file (~GB size)
- Verified block splitting based on 128 MB block size
Script:
source/large_log_file.sh

## Phase 3 — Built-in MapReduce WordCount
Executed Hadoop WordCount using log data stored in HDFS.
Key Observation:
- Number of mappers = number of HDFS blocks
- Hadoop automatically handled shuffle and reduce

## Phase 4 — Python WordCount using Hadoop Streaming
Implemented distributed WordCount using Python mapper and reducer.
Scripts:
custom_mapreduce/mapper.py
custom_mapreduce/reducer.py
custom_mapreduce/phase4_run_streaming.sh

Comparison:
- Built-in WordCount faster
- Python streaming more flexible and easier to develop

## Phase 5 — Error-Focused Log Analysis
Filtered logs where HTTP status ≥ 400 and computed error frequency.
Scripts:
custom_mapreduce/error_mapper.py
custom_mapreduce/phase5_run_streaming.sh
custom_mapreduce/reducer.py

Result:
- Frequency of error status codes
- Reduced data processing using filtering

## Phase 6 — Hadoop Architecture Study
Documented evolution of Hadoop architecture (1.x → 3.x).
File:
source/architecture.txt

Key Topics:
- JobTracker vs TaskTracker limitations
- Introduction of YARN
- ResourceManager & NodeManager
- High availability improvements

## Phase 7 — Configuration & Performance Tuning
Analyzed Hadoop configuration and optimized:
- HDFS block size
- MapReduce memory
- YARN resource allocation
Result:
- Improved job execution
- Reduced I/O overhead
- Better resource utilization