#!/bin/bash

./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-true-true --MaxVehicles=100 --Project1=True --Project2=True"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-false-false --MaxVehicles=100 --Project1=False --Project2=False"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-true-false --MaxVehicles=100 --Project1=True --Project2=False"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-false-true --MaxVehicles=100 --Project1=False --Project2=True"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-standard-standard-standard --MaxVehicles=100"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-hard_2_3-soft_1_8-time_2_3 --MaxVehicles=100 --Hard=2.3 --Soft=1.8 --TimeThr=2.3 --TimeDelay=2.3"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-hard_1_5-soft_1_2-time_1_5 --MaxVehicles=100 --Hard=1.5 --Soft=1.2 --TimeThr=1.5 --TimeDelay=1.5"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-window_1 --MaxVehicles=100 --TimeWindow=1"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-window_2 --MaxVehicles=100 --TimeWindow=2"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-window_3 --MaxVehicles=100 --TimeWindow=3"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-window_4 --MaxVehicles=100 --TimeWindow=4"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-window_8 --MaxVehicles=100 --TimeWindow=8"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=50veh-all_standard --MaxVehicles=50"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=75veh-all_standard --MaxVehicles=75"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-all_standard --MaxVehicles=100"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=125veh-all_standard --MaxVehicles=125"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=150veh-all_standard --MaxVehicles=150"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=175veh-all_standard --MaxVehicles=175"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=200veh-all_standard --MaxVehicles=200"


