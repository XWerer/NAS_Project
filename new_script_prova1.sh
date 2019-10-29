#!/bin/bash

./waf --run "scratch/project-test --Port=3401 --Interval=0.3125 --Window=0.5 --PacketSize=1000 --Filename=new-prova-100-1 --MaxVehicles=100 --SimTime=90"
./waf --run "scratch/project-test --Port=3401 --Interval=0.15625 --Window=0.5 --PacketSize=500 --Filename=new-prova-100-2 --MaxVehicles=100 --SimTime=90"
./waf --run "scratch/project-test --Port=3401 --Interval=0.3125 --Window=0.5 --PacketSize=1000 --Filename=new-prova-200-1 --MaxVehicles=200 --SimTime=90"
./waf --run "scratch/project-test --Port=3401 --Interval=0.15625 --Window=0.5 --PacketSize=500 --Filename=new-prova-200-2 --MaxVehicles=200 --SimTime=90"
./waf --run "scratch/project-test --Port=3401 --Interval=0.3125 --Window=0.5 --PacketSize=1000 --Filename=new-prova-300-1 --MaxVehicles=300 --SimTime=90"
./waf --run "scratch/project-test --Port=3401 --Interval=0.15625 --Window=0.5 --PacketSize=500 --Filename=new-prova-300-2 --MaxVehicles=300 --SimTime=90"
./waf --run "scratch/project-test --Port=3401 --Interval=0.3125 --Window=0.5 --PacketSize=1000 --Filename=new-prova-400-1 --MaxVehicles=400 --SimTime=90"
./waf --run "scratch/project-test --Port=3401 --Interval=0.15625 --Window=0.5 --PacketSize=500 --Filename=new-prova-400-2 --MaxVehicles=400 --SimTime=90"