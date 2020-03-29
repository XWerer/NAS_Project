#!/bin/bash

./waf --run "scratch/project-test --Port=3401 --Interval=0.078125 --Window=0.5 --PacketSize=500 --Filename=prova-400-1 --MaxVehicles=400 --SimTime=90"
./waf --run "scratch/project-test --Port=3401 --Interval=0.15625 --Window=0.5 --PacketSize=1000 --Filename=prova-400-2 --MaxVehicles=400 --SimTime=90"
./waf --run "scratch/project-test --Port=3401 --Interval=0.3125 --Window=0.5 --PacketSize=2000 --Filename=prova-400-3 --MaxVehicles=400 --SimTime=90"
./waf --run "scratch/project-test --Port=3401 --Interval=0.078125 --Window=0.5 --PacketSize=1000 --Filename=prova-400-2_1 --MaxVehicles=400 --SimTime=90"
./waf --run "scratch/project-test --Port=3401 --Interval=0.15625 --Window=0.5 --PacketSize=2000 --Filename=prova-400-3_1 --MaxVehicles=400 --SimTime=90"