echo "delete the output directory if it is exists"
hdfs dfs -rm -r -f /wc_output

echo "implementing the word count"
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples*.jar wordcount /biglogs/access.log /wc_output

echo "list the output directory"
hdfs dfs -ls /wc_output

echo "viewing the word count"
hdfs dfs -cat /wc_output/part-r-00000 | head
