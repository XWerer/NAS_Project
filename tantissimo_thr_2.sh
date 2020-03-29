#!/bin/bash

./waf --run "scratch/project-test --Port=3401 --Interval=0.00025 --Window=1 --PacketSize=500 --Filename=300_0.00025_500_15M --MaxVehicles=300 --SimTime=90"
./waf --run "scratch/project-test --Port=3401 --Interval=0.0005 --Window=1 --PacketSize=1000 --Filename=300_0.0005_1000_15M --MaxVehicles=300 --SimTime=90"
./waf --run "scratch/project-test --Port=3401 --Interval=0.001 --Window=1 --PacketSize=2000 --Filename=300_0.001_2000_15M --MaxVehicles=300 --SimTime=90"
