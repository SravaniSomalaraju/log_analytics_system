echo "=====execution starts========"

echo "deleted the output directory if its already exists"
hdfs dfs -rm -r -f /error_output

echo "generating the output....."
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming*.jar \
-input /biglogs/access.log \
-output /error_output \
-mapper "python3 error_mapper.py" \
-reducer "python3 reducer.py" \
-file error_mapper.py \
-file reducer.py

echo "listing the output directory"
hdfs dfs -ls /error_output

echo "viewing the output"
hdfs dfs -cat /error_output/part-00000 | head