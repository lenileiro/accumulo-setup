#HADOOP VARIABLES START
export HADOOP_PREFIX=/opt/hadoop
export HADOOP_COMMON_HOME=/opt/hadoop
export HADOOP_HDFS_HOME=/opt/hadoop
export HADOOP_MAPRED_HOME=/opt/hadoop
export HADOOP_YARN_HOME=/opt/hadoop
export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop
export YARN_CONF_DIR=/opt/hadoop/etc/hadoop
export PATH=$PATH:/opt/hadoop/bin
#HADOOP VARIABLES END

#HADOOP VARIABLES START -2.6.5
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib"
#HADOOP VARIABLES END

#HADOOP VARIABLES START -3.2.0
export HADOOP_INSTALL=/opt/hadoop
export PATH=$PATH:$HADOOP_INSTALL/bin
export PATH=$PATH:$HADOOP_INSTALL/sbin
export HADOOP_MAPRED_HOME=$HADOOP_INSTALL
export HADOOP_COMMON_HOME=$HADOOP_INSTALL
export HADOOP_HDFS_HOME=$HADOOP_INSTALL
export YARN_HOME=$HADOOP_INSTALL
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_INSTALL/lib/native
export HADOOP_OPTS="-Djava.library.path=$HADOOP_INSTALL/lib"
#HADOOP VARIABLES END

``` bash
echo "Running Configuration"
sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/lib/jvm/java-11-openjdk\nexport HADOOP_PREFIX=/opt/hadoop\nexport HADOOP_HOME=/opt/hadoop\n:' /opt/hadoop/etc/hadoop/hadoop-env.sh
sed -i '/^export HADOOP_CONF_DIR/ s:.*:export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop/:' /opt/hadoop/etc/hadoop/hadoop-env.sh
sed -i '/^hadoop.log.dir=.*/ s:.*:hadoop.log.dir=/var/log/hadoop:' /opt/hadoop/etc/hadoop/log4j.properties
sed -i 's|YARN_OPTS="$YARN_OPTS -Dhadoop.log.dir=$YARN_LOG_DIR"|YARN_OPTS="$YARN_OPTS -Djava.net.preferIPv4Stack=true"\nYARN_OPTS="$YARN_OPTS -Dhadoop.log.dir=$YARN_LOG_DIR"|' /opt/hadoop/etc/hadoop/yarn-env.sh
mkdir -p /opt/hadoop/input
chmod +x /opt/hadoop/etc/hadoop/*-env.sh
cp /opt/hadoop/etc/hadoop/*.xml /opt/hadoop/input
```