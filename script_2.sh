#!/bin/bash

./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-standard-standard-standard --MaxVehicles=100"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-hard_2_3-soft_1_8-time_2_3 --MaxVehicles=100 --Hard=2.3 --Soft=1.8 --TimeThr=2.3 --TimeDelay=2.3"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-hard_1_5-soft_1_2-time_1_5 --MaxVehicles=100 --Hard=1.5 --Soft=1.2 --TimeThr=1.5 --TimeDelay=1.5"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-window_3 --MaxVehicles=100 --TimeWindow=3"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-window_4 --MaxVehicles=100 --TimeWindow=4"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-window_8 --MaxVehicles=100 --TimeWindow=8"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=50veh-all_standard --MaxVehicles=50"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=100veh-all_standard --MaxVehicles=100"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=125veh-all_standard --MaxVehicles=125"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=200veh-all_standard --MaxVehicles=200"


