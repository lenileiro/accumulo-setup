#!/bin/bash -eu
echo "downloading"
rm -rf /home/leiro/Desktop/accumulo/
rm -rf /home/leiro/Desktop/accumulo-1.8.1/
rm -rf  /var/log/accumulo/
#wget -O /home/leiro/Desktop/accumulo-1.8.1-bin.tar.gz http://archive.apache.org/dist/accumulo/1.8.1/accumulo-1.8.1-bin.tar.gz
tar -xzf /home/leiro/Desktop/accumulo-1.8.1-bin.tar.gz -C /home/leiro/Desktop/
#rm /opt/accumulo-1.6.1-bin.tar.gz

echo "setup"
mv -i /home/leiro/Desktop/accumulo-1.8.1 /home/leiro/Desktop/accumulo
cp /home/leiro/Desktop/accumulo/conf/examples/512MB/standalone/* /home/leiro/Desktop/accumulo/conf
sed -i -e "s|HADOOP_PREFIX=/path/to/hadoop|HADOOP_PREFIX=/home/leiro/Desktop/hadoop|" \
    -e "s|JAVA_HOME=/path/to/java|JAVA_HOME=/usr/lib/jvm/java-8-openjdk|" \
    -e "s|ZOOKEEPER_HOME=/path/to/zookeeper|ZOOKEEPER_HOME=/home/leiro/Desktop/zookeeper|" \
    -e "s|.*export ACCUMULO_MONITOR_BIND_ALL.*|export ACCUMULO_MONITOR_BIND_ALL=\"true\"|" \
    /home/leiro/Desktop/accumulo/conf/accumulo-env.sh
sed -i -e "s|localhost|0.0.0.0|" /home/leiro/Desktop/accumulo/conf/masters
sed -i -e "s|localhost|0.0.0.0|" /home/leiro/Desktop/accumulo/conf/slaves
sed -i -e "s|localhost|0.0.0.0|" /home/leiro/Desktop/accumulo/conf/tracers
sed -i -e "s|localhost|0.0.0.0|" /home/leiro/Desktop/accumulo/conf/gc
sed -i -e "s|localhost|0.0.0.0|" /home/leiro/Desktop/accumulo/conf/monitor
sed -i -e "s|<value>secret</value>|<value>password</value>|" /home/leiro/Desktop/accumulo/conf/accumulo-site.xml
chmod -R 0777 /home/leiro/Desktop/accumulo
chmod -R 0777 /home/leiro/Desktop/accumulo-1.8.1-bin.tar.gz
echo "complete"