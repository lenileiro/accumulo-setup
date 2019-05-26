#!/bin/bash -eu

wget -O /opt/zookeeper-3.4.14.tar.gz http://www.us.apache.org/dist/zookeeper/zookeeper-3.4.14/zookeeper-3.4.14.tar.gz
tar -xzf /opt/zookeeper-3.4.14.tar.gz -C /home/leiro/Desktop
rm /opt/zookeeper-3.4.14.tar.gz
mv -i /opt/zookeeper-3.4.14 /opt/zookeeper
cp /home/leiro/Desktop/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg

cat configurations/.bash_profile.xml >> ~/.bash_profile
source ~/.bash_profile

chmod -R 0777 /opt/zookeeper