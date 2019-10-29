#!/bin/bash

./waf --run "scratch/project-test --Port=3410 --Interval=0.040 --Window=0.5 --PacketSize=2000 --Filename=prova4-new-1 --MaxVehicles=200 --SimTime=30"
./waf --run "scratch/project-test --Port=3410 --Interval=0.080 --Window=0.5 --PacketSize=2000 --Filename=prova4-new-2 --MaxVehicles=200 --SimTime=30"
./waf --run "scratch/project-test --Port=3410 --Interval=0.100 --Window=0.5 --PacketSize=2000 --Filename=prova4-new-3 --MaxVehicles=200 --SimTime=30"
./waf --run "scratch/project-test --Port=3410 --Interval=0.200 --Window=0.5 --PacketSize=2000 --Filename=prova4-new-4 --MaxVehicles=200 --SimTime=30"
./waf --run "scratch/project-test --Port=3410 --Interval=0.300 --Window=0.5 --PacketSize=2000 --Filename=prova4-new-5 --MaxVehicles=200 --SimTime=30"
./waf --run "scratch/project-test --Port=3410 --Interval=0.500 --Window=0.5 --PacketSize=2000 --Filename=prova4-new-6 --MaxVehicles=200 --SimTime=30"
./waf --run "scratch/project-test --Port=3410 --Interval=0.800 --Window=0.5 --PacketSize=2000 --Filename=prova4-new-7 --MaxVehicles=200 --SimTime=30"
./waf --run "scratch/project-test --Port=3410 --Interval=0.007 --Window=0.5 --PacketSize=2000 --Filename=prova4-new-8 --MaxVehicles=200 --SimTime=30"
./waf --run "scratch/project-test --Port=3410 --Interval=0.015 --Window=0.5 --PacketSize=2000 --Filename=prova4-new-9 --MaxVehicles=200 --SimTime=30"
./waf --run "scratch/project-test --Port=3410 --Interval=0.030 --Window=0.5 --PacketSize=2000 --Filename=prova4-new-0 --MaxVehicles=200 --SimTime=30"