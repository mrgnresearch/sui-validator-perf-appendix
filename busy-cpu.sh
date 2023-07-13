#!/bin/bash

#Example test for CPU stress-testing
#Verify that when the busy script is pinned, that the cpu hits the frequency expected with
#cpufreq-info, turbostat or similar
#If your cpu has hyperthreading, figure out which physical threads share a core and pin 1 thread to each actual core
for i in $(seq 0 31); do
  taskset -c $i sh -c 'while true; do :; done' &
done

sleep 30

pkill -f "while true; do :; done"