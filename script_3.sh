#!/bin/bash


./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=200veh-false-false --MaxVehicles=200 --Project1=False --Project2=False"

./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=150veh-true-false --MaxVehicles=150 --Project1=True --Project2=False"
./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=200veh-true-false --MaxVehicles=200 --Project1=True --Project2=False"

./waf --run "scratch/project-test --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=200veh-false-true --MaxVehicles=200 --Project1=False --Project2=True"




