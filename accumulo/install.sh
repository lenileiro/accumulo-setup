#!/bin/bash -eu
echo "downloading"
rm -rf /opt/accumulo/
rm -rf /opt/accumulo-1.9.3/
wget -O /opt/accumulo-1.9.3-bin.tar.gz http://archive.apache.org/dist/accumulo/1.9.3/accumulo-1.9.3-bin.tar.gz
tar -xzf /opt/accumulo-1.9.3-bin.tar.gz -C /opt
rm /opt/accumulo-1.9.3-bin.tar.gz

echo "setup"
ln -s /opt/accumulo-1.9.3 /opt/accumulo
rm -rf /opt/accumulo-1.9.3/logs
mkdir -p /var/log/accumulo
ln -s /var/log/accumulo /opt/accumulo-1.9.3/logs

cp /opt/accumulo/conf/examples/512MB/standalone/* /opt/accumulo/conf
sed -i -e "s|HADOOP_PREFIX=/path/to/hadoop|HADOOP_PREFIX=/opt/hadoop|" \
    -e "s|JAVA_HOME=/path/to/java|JAVA_HOME=/usr/lib/jvm/java-8-openjdk|" \
    -e "s|ZOOKEEPER_HOME=/path/to/zookeeper|ZOOKEEPER_HOME=/optzookeeper|" \
    /opt/accumulo/conf/accumulo-env.sh

cat accumulo/configurations/accumulo-site.xml > /opt/accumulo/conf/accumulo-site.xml

chmod -R 0777 /opt/accumulo
echo "complete"