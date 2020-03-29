#!/bin/bash

./waf --run "scratch/project-test --Port=3401 --Interval=0.0004 --Window=1 --PacketSize=500 --Filename=300_0.0004_500_10M --MaxVehicles=300 --SimTime=90"
./waf --run "scratch/project-test --Port=3401 --Interval=0.0008 --Window=1 --PacketSize=1000 --Filename=300_0.0008_1000_10M --MaxVehicles=300 --SimTime=90"
./waf --run "scratch/project-test --Port=3401 --Interval=0.0016 --Window=1 --PacketSize=2000 --Filename=300_0.0016_2000_10M --MaxVehicles=300 --SimTime=90"
