#!/bin/bash

./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=50s-50veh-window_8-true-true --MaxVehicles=50 --TimeWindow=8 --Project1=True --Project2=True"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=50s-50veh-window_8-false-false --MaxVehicles=50 --TimeWindow=8 --Project1=False --Project2=False"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=50s-50veh-window_8-true-false --MaxVehicles=50 --TimeWindow=8 --Project1=True --Project2=False"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=50s-50veh-window_8-false-true --MaxVehicles=50 --TimeWindow=8 --Project1=False --Project2=True"



