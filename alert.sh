#!/bin/sh
###############################################################################
# author: ashok.shivarudriah
# Command line alert with announcement when the time is up
###############################################################################
Usage() {
  prog_name=$(basename $0)
  printf "%s: Alerts after n sec\n" ${prog_name}
  printf "Usage: %s <n seconds>\n" ${prog_name}
  printf "eg:\n"
  printf "  %s 300     for sleeping for  5 min\n" ${prog_name}
  printf "  %s 900     for sleeping for 15 min\n" ${prog_name}
  printf "  %s 1800    for sleeping for 30 min\n" ${prog_name}
  printf "  %s 3600    for sleeping for  1 hour\n" ${prog_name}
  printf "\n\n"
  exit -2
}

if [ $# -lt 1 ]; then
  Usage;
fi
SLEEP_TIME=${1}
UPDATE_TIME_IN_SEC=5

printf "%4d of %4d sec left" ${SLEEP_TIME} ${SLEEP_TIME}
while [ ${SLEEP_TIME} -gt 0 ]; do
  sleep ${UPDATE_TIME_IN_SEC}
  SLEEP_TIME=$(expr ${SLEEP_TIME} - ${UPDATE_TIME_IN_SEC})
  printf "\r%4d" ${SLEEP_TIME}
done

# if you are not on mac comment the below line
say 'times up!!'
printf "\n"
