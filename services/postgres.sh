#!/bin/bash
### Postgres Server ###
case "$2" in
        start)
            `pg_ctl -D /usr/local/var/postgres -l logfile -s start`
            ;;

        stop)
            PID=/usr/local/var/run/postgresql.pid
            if [ -f $PID ];
              then
                `cat /usr/local/var/run/postgresql.pid|xargs kill -15`
              else
                echo "Postgres is not running"
            fi
            ;;

        status)
            PID=/usr/local/var/run/postgresql.pid
            if [ -f $PID ];
              then
                echo "Postgres is running with pid " `cat $PID`
              else
                echo "Postgres is not running"
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
