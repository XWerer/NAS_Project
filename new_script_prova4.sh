#!/bin/bash

./waf --run "scratch/project-test --Port=3404 --Interval=0.0390625 --Window=0.5 --PacketSize=250 --Filename=new-prova-100-6 --MaxVehicles=100 --SimTime=90"
./waf --run "scratch/project-test --Port=3404 --Interval=0.0390625 --Window=0.5 --PacketSize=250 --Filename=new-prova-200-6 --MaxVehicles=200 --SimTime=90"
./waf --run "scratch/project-test --Port=3404 --Interval=0.0390625 --Window=0.5 --PacketSize=250 --Filename=new-prova-300-6 --MaxVehicles=300 --SimTime=90"
./waf --run "scratch/project-test --Port=3404 --Interval=0.0390625 --Window=0.5 --PacketSize=250 --Filename=new-prova-400-6 --MaxVehicles=400 --SimTime=90"
