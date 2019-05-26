export HADOOP_HOME=~/opt/hadoop

hadoop() {
	if [ -z "$1" ]
		then
			echo "-No Parameter passed [ init | start | stop ]-"

	else if ["$1" -eq 'init']
		then
			/opt/hadoop/sbin/stop-dfs.sh # Stop Hadoop's nodes
			rm -rf hdfs_storage # Delete the namenode data
			rm -rf /opt/hadoop/tmp/hadoop-* # Delete the temporary directories
			/opt/hadoop/bin/hdfs namenode -format # Reformat the namenode
	else
		/opt/hadoop/sbin/$1-yarn.sh
		/opt/hadoop/sbin/$1-dfs.sh
	fi
}
