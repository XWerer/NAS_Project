#!/bin/bash

./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-true-true --MaxVehicles=100 --Project1=True --Project2=True"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-false-false --MaxVehicles=100 --Project1=False --Project2=False"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-true-false --MaxVehicles=100 --Project1=True --Project2=False"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-false-true --MaxVehicles=100 --Project1=False --Project2=True"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-window_1 --MaxVehicles=100 --TimeWindow=1"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-window_2 --MaxVehicles=100 --TimeWindow=2"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=75veh-all_standard --MaxVehicles=75"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=150veh-all_standard --MaxVehicles=150"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=175veh-all_standard --MaxVehicles=175"



