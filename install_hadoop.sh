#!/bin/bash -eu

echo "Cleaning"
rm -rf /home/leiro/Desktop/hadoop
rm -rf /home/leiro/Desktop/hadoop-3.2.0
#wget -O /opt/hadoop-3.2.0.tar.gz https://archive.apache.org/dist/hadoop/core/hadoop-3.2.0/hadoop-3.2.0.tar.gz

echo "Extracting"
tar -xzf /opt/hadoop-3.2.0.tar.gz -C /home/leiro/Desktop

#rm /opt/hadoop-2.6.5.tar.gz
cp -r /home/leiro/Desktop/hadoop-3.2.0 /home/leiro/Desktop/hadoop

#chmod -R 0777 /opt/hadoop/
echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk'>>/home/leiro/Desktop/hadoop/etc/hadoop/hadoop-env.sh
cat core-site.xml > /home/leiro/Desktop/hadoop/etc/hadoop/core-site.xml
cat hdfs-site.xml > /home/leiro/Desktop/hadoop/etc/hadoop/hdfs-site.xml
cat mapred-site.xml > /home/leiro/Desktop/hadoop/etc/hadoop/mapred-site.xml

echo "setup done"
