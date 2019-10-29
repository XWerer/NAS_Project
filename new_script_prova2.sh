#!/bin/bash

./waf --run "scratch/project-test --Port=3402 --Interval=0.07825 --Window=0.5 --PacketSize=250 --Filename=new-prova-100-3 --MaxVehicles=100 --SimTime=90"
./waf --run "scratch/project-test --Port=3402 --Interval=0.15625 --Window=0.5 --PacketSize=1000 --Filename=new-prova-100-4 --MaxVehicles=100 --SimTime=90"
./waf --run "scratch/project-test --Port=3402 --Interval=0.07825 --Window=0.5 --PacketSize=250 --Filename=new-prova-200-3 --MaxVehicles=200 --SimTime=90"
./waf --run "scratch/project-test --Port=3402 --Interval=0.15625 --Window=0.5 --PacketSize=1000 --Filename=new-prova-200-4 --MaxVehicles=200 --SimTime=90"
./waf --run "scratch/project-test --Port=3402 --Interval=0.07825 --Window=0.5 --PacketSize=250 --Filename=new-prova-300-3 --MaxVehicles=300 --SimTime=90"
./waf --run "scratch/project-test --Port=3402 --Interval=0.15625 --Window=0.5 --PacketSize=1000 --Filename=new-prova-300-4 --MaxVehicles=300 --SimTime=90"
./waf --run "scratch/project-test --Port=3402 --Interval=0.07825 --Window=0.5 --PacketSize=250 --Filename=new-prova-400-3 --MaxVehicles=400 --SimTime=90"
./waf --run "scratch/project-test --Port=3402 --Interval=0.15625 --Window=0.5 --PacketSize=1000 --Filename=new-prova-400-4 --MaxVehicles=400 --SimTime=90"