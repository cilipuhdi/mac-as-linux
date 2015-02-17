#!/bin/bash
### Salt Master ###
case "$2" in
        start)
            `/usr/bin/python /usr/local/bin/salt-master -d`
            ;;

        stop)
            `cat /var/run/salt/salt-master.pid|xargs kill -15;echo ''>/var/run/salt/salt-master.pid`
            ;;

        status)
            FILENAME=/var/run/salt/salt-master.pid
            SALT_PID=`cat $FILENAME`
            minimumsize=2
            actualsize=$(ls -l $FILENAME| awk '{ print $5 }')
            if [ $actualsize -ge $minimumsize ]; then
               echo SaltStack is running with pid $SALT_PID
             else
               echo SaltStack is not running
            fi
            ;;
        restart)
            stop
            start
            ;;

        *)
            echo $"Usage: {start|stop|restart|status}"
            exit 1

esac
