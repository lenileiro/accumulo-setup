#!/bin/bash -eu
rm -rf /opt/accumulo/
rm -rf /opt/accumulo-1.9.3/
rm -rf  /var/log/accumulo/
wget -O /opt/accumulo-1.9.3-bin.tar.gz http://archive.apache.org/dist/accumulo/1.9.3/accumulo-1.9.3-bin.tar.gz
tar -xzf /opt/accumulo-1.9.3-bin.tar.gz -C /opt
#rm /opt/accumulo-1.6.1-bin.tar.gz
mv -i /opt/accumulo-1.9.3 /opt/accumulo
mkdir -p /var/log/accumulo
rm -rf /opt/accumulo/logs
cp /opt/accumulo/conf/examples/512MB/standalone/* /opt/accumulo/conf
sed -i -e "s|HADOOP_PREFIX=/path/to/hadoop|HADOOP_PREFIX=/opt/hadoop|" \
    -e "s|JAVA_HOME=/path/to/java|JAVA_HOME=/usr/lib/jvm/java-11-openjdk|" \
    -e "s|ZOOKEEPER_HOME=/path/to/zookeeper|ZOOKEEPER_HOME=/opt/zookeeper|" \
    -e "s|.*export ACCUMULO_MONITOR_BIND_ALL.*|export ACCUMULO_MONITOR_BIND_ALL=\"true\"|" \
    /opt/accumulo/conf/accumulo-env.sh
sed -i -e "s|localhost|0.0.0.0|" /opt/accumulo/conf/masters
sed -i -e "s|localhost|0.0.0.0|" /opt/accumulo/conf/slaves
sed -i -e "s|localhost|0.0.0.0|" /opt/accumulo/conf/tracers
sed -i -e "s|localhost|0.0.0.0|" /opt/accumulo/conf/gc
sed -i -e "s|localhost|0.0.0.0|" /opt/accumulo/conf/monitor
sed -i -e "s|<value>secret</value>|<value>password</value>|" /opt/accumulo/conf/accumulo-site.xml
chmod -R 0777 /opt/accumulo
echo "complete"