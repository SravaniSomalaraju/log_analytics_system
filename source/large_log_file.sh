# Task 3: Large Log File Scalability Test
# The system starts aggregating logs from multiple services, resulting in a large log file (1 GB or more).

# Actions
# Generate or simulate a large log file using the same log structure
# Upload the file to HDFS
# Verify that the file is split into multiple blocks

# Constraints
# HDFS block size must be configured to 128 MB

# Expected Analysis
# Determine the number of blocks created
# Explain how block size impacts parallelism, storage, and fault tolerance
echo "created a directory"
hdfs dfs -mkdir /biglogs

echo "upload file to hdfs"
hdfs dfs -put /mnt/d/access.log /biglogs

echo "listing the files"
hdfs dfs -ls /biglogs

echo "identifying the blocks"
hdfs fsck /biglogs/access.log -files -blocks

echo "created blocks"