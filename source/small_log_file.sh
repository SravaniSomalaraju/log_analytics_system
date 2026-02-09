

#1. Upload log file to HDFS
echo "created a directory"
hdfs dfs -mkdir /logs

#2.upload file to hdfs
echo "uploade local file to hdfs"
hdfs dfs -put /mnt/d/logfiles.log /logs

#3.list the files
echo "listing the files"
hdfs dfs -ls  /logs


#4.Identify how many HDFS blocks are created
echo "identifying the hdfs blocks"
hdfs fsck /logs/logfiles.log -files -blocks

#Analyze block allocation behavior for small files
echo "File size ≈ 240273 KB (~234 MB)"
echo "HDFS block size = 128 MB"
echo "Number of blocks created = 2"
