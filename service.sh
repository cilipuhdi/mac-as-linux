#!/bin/bash
#############################################################
#   This is an attempt to make a "service" command akin     #
#   to that found in Linux init systems.                    #
#   The goal is to be able to write commands in the OSX     #
#   command line that behave the same way, making scripting #
#   between the two systems a parallel endeavor.            #
#   Hopefully, this solves some headaches for development   #
#   across the two systems.                                 #
#############################################################

if [ -z "$1" ]
  then
    echo "Available Services:"; ls services/ |cut -d'.' -f1
  elif [ "$1" == "salt" ];then
    source ./services/salt.sh
  elif [ "$1" == "redis" ];then
    source ./services/redis.sh
  elif [ "$1" == "postgres" ];then
    source ./services/postgres.sh
  elif [ "$1" == "test" ];then
    source ./services/test.sh
  else
    echo Not a Service
fi
