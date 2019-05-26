#ACCUMULO START 
accumulo() {
     if [ -z "$1" ]
		then
			echo "-No Parameter passed [ start | stop ]-"
	else
        if /opt/accumulo/bin/accumulo info 2>&1 | grep --quiet "Accumulo not initialized"; then
            echo "**************** INITIALIZING ACCUMULO ****************"
            /opt/accumulo/bin/accumulo init --instance-name INSTANCE --password secret
        fi
        /opt/accumulo/bin/$1-all.sh
    fi
}
#ACCUMULO STOP