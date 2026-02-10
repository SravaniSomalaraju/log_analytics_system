#!/bin/bash
echo "remove output directory if already exists"
hdfs dfs -rm -r -f /py_wc_output

echo "output starts generating"
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming*.jar \
-input /biglogs/access.log \
-output /py_wc_output \
-mapper "python3 mapper.py" \
-reducer "python3 reducer.py" \
-file mapper.py \
-file reducer.py

echo "listing the output directory"
hdfs dfs -ls /py_wc_output

echo "viewing the output"
hdfs dfs -cat /py_wc_output/part-00000 | head






