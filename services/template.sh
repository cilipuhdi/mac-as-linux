#!/bin/bash
# Services Case Template
  case "$2" in
          start)
              # Place start function here
              ;;

          stop)
              # Place stop function here
              ;;

          status)
              # Place status function here
              ;;
          restart)
              stop
              start
              ;;

          *)
              echo $"Usage: {start|stop|restart|status}"
              exit 1

  esac
##TODO:
# - Create a functional template that will pull the functions in based on the requested service.
