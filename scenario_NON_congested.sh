#!/bin/bash

./waf --run "scratch/project-test --Port=3401 --Interval=0.0391 --Window=0.5 --PacketSize=500 --Filename=provaNC-400-1 --MaxVehicles=200 --SimTime=90"
./waf --run "scratch/project-test --Port=3401 --Interval=0.0781 --Window=0.5 --PacketSize=1000 --Filename=provaNC-400-2 --MaxVehicles=200 --SimTime=90"
./waf --run "scratch/project-test --Port=3401 --Interval=0.15625 --Window=0.5 --PacketSize=2000 --Filename=provaNC-400-3 --MaxVehicles=200 --SimTime=90"
./waf --run "scratch/project-test --Port=3401 --Interval=0.0391 --Window=0.5 --PacketSize=1000 --Filename=provaNC-400-2_1 --MaxVehicles=200 --SimTime=90"
./waf --run "scratch/project-test --Port=3401 --Interval=0.0781 --Window=0.5 --PacketSize=2000 --Filename=provaNC-400-3_1 --MaxVehicles=200 --SimTime=90"