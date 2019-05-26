## Add scripts into ~/.profile

```
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export HADOOP_HOME=~/opt/hadoop-2.9.2/
export ZOOKEEPER_HOME=~/opt/zookeeper-3.4.14/
```

```
hadoop() {
if [ -z "$1" ]
	 then
		 echo "-No Parameter passed [start | stop ].-"
	else
		/opt/hadoop/sbin/$1-yarn.sh
		/opt/hadoop/sbin/$1-dfs.sh
   fi
}
```
```
zookeeper() {
	if [ -z "$1" ]
	 then
		 echo "-No Parameter passed [start | stop ].-"
	else
		 /opt/zookeeper-3.4.14/bin/zkServer.sh $1
   fi
}
```
```
hadoop() {
if [ -z "$1" ]
	 then
		 echo "-No Parameter passed [start | stop ].-"
	else
		/opt/hadoop-2.9.2/sbin/$1-yarn.sh
		/opt/hadoop-2.9.2/sbin/$1-dfs.sh
   fi
}
hadoop_config() {
    /opt/hadoop-2.9.2/sbin/stop-dfs.sh # Stop Hadoop's nodes
    rm -rf hdfs_storage # Delete the namenode data
    rm -rf /opt/hadoop-2.9.2/tmp/hadoop-* # Delete the temporary directories
    /opt/hadoop-2.9.2/bin/hdfs namenode -format # Reformat the namenode
}
zookeeper() {
	if [ -z "$1" ]
	 then
		 echo "-No Parameter passed [start | stop ].-"
	else
		 /opt/zookeeper-3.4.14/bin/zkServer.sh $1
   fi
}

```
load changes
```
    source ~/.profile
```
## start hadoop 

```
    hadoop start
```
## start zookeeper

```
    zookeeper start
```

