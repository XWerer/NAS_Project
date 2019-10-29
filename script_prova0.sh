#!/bin/bash

./waf --run "scratch/project-test --Port=3409 --Interval=0.040 --Window=0.5 --PacketSize=1000 --Filename=prova0-new-1 --MaxVehicles=400 --SimTime=30"
./waf --run "scratch/project-test --Port=3409 --Interval=0.080 --Window=0.5 --PacketSize=1000 --Filename=prova0-new-2 --MaxVehicles=400 --SimTime=30"
./waf --run "scratch/project-test --Port=3409 --Interval=0.100 --Window=0.5 --PacketSize=1000 --Filename=prova0-new-3 --MaxVehicles=400 --SimTime=30"
./waf --run "scratch/project-test --Port=3409 --Interval=0.200 --Window=0.5 --PacketSize=1000 --Filename=prova0-new-4 --MaxVehicles=400 --SimTime=30"
./waf --run "scratch/project-test --Port=3409 --Interval=0.300 --Window=0.5 --PacketSize=1000 --Filename=prova0-new-5 --MaxVehicles=400 --SimTime=30"
./waf --run "scratch/project-test --Port=3409 --Interval=0.500 --Window=0.5 --PacketSize=1000 --Filename=prova0-new-6 --MaxVehicles=400 --SimTime=30"
./waf --run "scratch/project-test --Port=3409 --Interval=0.800 --Window=0.5 --PacketSize=1000 --Filename=prova0-new-7 --MaxVehicles=400 --SimTime=30"
#./waf --run "scratch/project-test --Port=3409 --Interval=0.007 --Window=0.5 --PacketSize=1000 --Filename=prova0-new-8 --MaxVehicles=400 --SimTime=30"
#./waf --run "scratch/project-test --Port=3409 --Interval=0.015 --Window=0.5 --PacketSize=1000 --Filename=prova0-new-9 --MaxVehicles=400 --SimTime=30"
#./waf --run "scratch/project-test --Port=3409 --Interval=0.030 --Window=0.5 --PacketSize=1000 --Filename=prova0-new-0 --MaxVehicles=400 --SimTime=30"
