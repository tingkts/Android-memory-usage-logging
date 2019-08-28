#!/bin/bash

LOGCNT=7037

while true ; do
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S ")
    ((LOGCNT=LOGCNT+1))

    delay=55
    LOGCNT_OUT=$(printf "%08d" "$LOGCNT")
    { echo -n "#${LOGCNT_OUT} ${TIMESTAMP}" ; adb shell cat /proc/meminfo | grep -E MemAvailable; }  >> logmem_avaiable.txt
    { echo -n "#${LOGCNT_OUT} ${TIMESTAMP}" ; adb shell cat /proc/meminfo | grep -E Slab; }  >> logmem_slab.txt
    if [ $LOGCNT -eq 1 ]; then
	echo -e   "                                PID       Vss      Rss      Pss      Uss  cmdline" >> logmem_system_server.txt
	echo -e   "                                PID       Vss      Rss      Pss      Uss  cmdline" >> logmem_system_ui.txt
    fi
    { echo -n "#${LOGCNT_OUT} ${TIMESTAMP}" ; adb shell procrank | grep -E system_server; }  >> logmem_system_server.txt
    { echo -n "#${LOGCNT_OUT} ${TIMESTAMP}" ; adb shell procrank | grep -E "com.android.systemui"; }  >> logmem_system_ui.txt
	
    echo "#${LOGCNT_OUT} ${TIMESTAMP} Wait $delay seconds for next sample."
    sleep $delay
done
