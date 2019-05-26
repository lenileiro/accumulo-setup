#!/bin/bash -eu
echo "downloading"
rm -rf /opt/accumulo/
rm -rf /opt/accumulo-1.8.1/
rm -rf  /var/log/accumulo/
wget -O /opt/accumulo-1.8.1-bin.tar.gz http://archive.apache.org/dist/accumulo/1.8.1/accumulo-1.8.1-bin.tar.gz
tar -xzf /opt/accumulo-1.8.1-bin.tar.gz -C /opt
#rm /opt/accumulo-1.6.1-bin.tar.gz

echo "setup"
mv -i /opt/accumulo-1.8.1 /opt/accumulo
cp /opt/accumulo/conf/examples/512MB/standalone/* opt/accumulo/conf
sed -i -e "s|HADOOP_PREFIX=/path/to/hadoop|HADOOP_PREFIX=/opt/hadoop|" \
    -e "s|JAVA_HOME=/path/to/java|JAVA_HOME=/usr/lib/jvm/java-8-openjdk|" \
    -e "s|ZOOKEEPER_HOME=/path/to/zookeeper|ZOOKEEPER_HOME=/optzookeeper|" \
    -e "s|.*export ACCUMULO_MONITOR_BIND_ALL.*|export ACCUMULO_MONITOR_BIND_ALL=\"true\"|" \
    /opt/accumulo/conf/accumulo-env.sh

sed -i -e "s|localhost|0.0.0.0|" /opt/accumulo/conf/masters
sed -i -e "s|localhost|0.0.0.0|" /opt/accumulo/conf/slaves
sed -i -e "s|localhost|0.0.0.0|" /opt/accumulo/conf/tracers
sed -i -e "s|localhost|0.0.0.0|" /opt/accumulo/conf/gc
sed -i -e "s|localhost|0.0.0.0|" /opt/accumulo/conf/monitor
sed -i -e "s|<value>secret</value>|<value>password</value>|" /opt/accumulo/conf/accumulo-site.xml

chmod -R 0777 /opt/accumulo
chmod -R 0777 /opt/accumulo-1.8.1-bin.tar.gz
echo "complete"