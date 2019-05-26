export ACCUMULO_MONITOR_BIND_ALL="true"
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