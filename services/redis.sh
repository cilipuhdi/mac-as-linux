#!/bin/bash
### Redis Server ###
case "$2" in
        start)
            `/usr/local/bin/redis-server /usr/local/etc/redis.conf`
            ;;

        stop)
            PID=/usr/local/var/run/redis.pid
            if [ -f $PID ];
              then
                `cat /usr/local/var/run/redis.pid|xargs kill -15;`
              else
                echo "redis-server is not running"
            fi
            ;;

        status)
            PID=/usr/local/var/run/redis.pid
            if [ -f $PID ];
              then
                echo "redis-server is running with pid " `cat $PID`
              else
                echo "redis-server is not running"
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
