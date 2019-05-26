if [ $(/opt/hadoop/bin/hadoop fs -ls /test | grep accumulo | wc -l) == "0" ]; then
    echo "Creating accumulo user in hdfs"
    /opt/hadoop/bin/hadoop fs -mkdir -p /test/input
    /opt/hadoop/bin/hadoop fs -chown accumulo /test/input
  fi

if [ $(/opt/hadoop/bin/hadoop fs -ls /leiro | grep accumulo | wc -l) == "0" ]; then
    echo "Creating accumulo user in hdfs"
    /opt/hadoop/bin/hadoop fs -mkdir -p /leiro/accumulo
    /opt/hadoop/bin/hadoop fs -chown accumulo /leiro/accumulo
  fi
  if [ $(/opt/hadoop/bin/hadoop fs -ls /accumulo | grep accumulo | wc -l) == "0" ]; then
    echo "Creating accumulo user in hdfs"
    /opt/hadoop/bin/hadoop fs -mkdir -p /accumulo
    /opt/hadoop/bin/hadoop fs -chown accumulo /accumulo
  fi
  /opt/hadoop/bin/hadoop fs -put count_inputfile /test/input/