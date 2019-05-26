#!/bin/bash -eu

echo "Cleaning"
rm -rf /opt/hadoop
rm -rf /opt/hadoop-2.9.2
wget -O /opt/hadoop-2.9.2.tar.gz https://archive.apache.org/dist/hadoop/core/hadoop-2.9.2/hadoop-2.9.2.tar.gz

echo "Extracting"
tar -xzf /opt/hadoop-2.9.2.tar.gz -C /home/leiro/Desktop

rm /opt/hadoop-2.9.2.tar.gz
cp -r /opt/hadoop-2.9.2 /opt/hadoop

chmod -R 0777 /home/leiro/Desktop/hadoop/
chmod -R 0777 /home/leiro/Desktop/hadoop-2.9.2
chmod -R 0777 /home/leiro/Desktop/hadoop-2.9.2.tar.gz

#set java path
echo "set configurations"
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk'>>/opt/hadoop/etc/hadoop/hadoop-env.sh
cat configurations/core-site.xml > /opt/hadoop/etc/hadoop/core-site.xml
cat configurations/hdfs-site.xml > /opt/hadoop/etc/hadoop/hdfs-site.xml
cat configurations/mapred-site.xml > /opt/hadoop/etc/hadoop/mapred-site.xml
cat configurations/yarn-site.xml > /opt/hadoop/etc/hadoop/yarn-site.xml
cat configurations/.bash_profile.xml >> ~/.bash_profile
source ~/.bash_profile
echo "setup done"
