#!/bin/bash

./waf --run "scratch/project-test --Port=3403 --Interval=0.07825 --Window=0.5 --PacketSize=500 --Filename=new-prova-100-5 --MaxVehicles=100 --SimTime=90"
./waf --run "scratch/project-test --Port=3403 --Interval=0.07825 --Window=0.5 --PacketSize=500 --Filename=new-prova-200-5 --MaxVehicles=200 --SimTime=90"
./waf --run "scratch/project-test --Port=3403 --Interval=0.07825 --Window=0.5 --PacketSize=500 --Filename=new-prova-300-5 --MaxVehicles=300 --SimTime=90"
./waf --run "scratch/project-test --Port=3403 --Interval=0.07825 --Window=0.5 --PacketSize=500 --Filename=new-prova-400-5 --MaxVehicles=400 --SimTime=90"
