#!/bin/bash

./waf --run "scratch/project-test --Port=3416 --Interval=0.8 --Window=0.5 --PacketSize=500 --Filename=400_0.8_500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3417 --Interval=0.5 --Window=0.5 --PacketSize=500 --Filename=400_0.5_500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3418 --Interval=0.3 --Window=0.5 --PacketSize=500 --Filename=400_0.3_500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3419 --Interval=0.2 --Window=0.5 --PacketSize=500 --Filename=400_0.2_500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3420 --Interval=0.1 --Window=0.5 --PacketSize=500 --Filename=400_0.1_500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3421 --Interval=0.04 --Window=0.5 --PacketSize=500 --Filename=400_0.04_500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3422 --Interval=0.015 --Window=0.5 --PacketSize=500 --Filename=400_0.015_500 --MaxVehicles=400 --SimTime=60" &

./waf --run "scratch/project-test --Port=3423 --Interval=0.8 --Window=0.5 --PacketSize=1000 --Filename=100_0.8_1000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3424 --Interval=0.5 --Window=0.5 --PacketSize=1000 --Filename=100_0.5_1000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3425 --Interval=0.3 --Window=0.5 --PacketSize=1000 --Filename=100_0.3_1000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3426 --Interval=0.2 --Window=0.5 --PacketSize=1000 --Filename=100_0.2_1000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3427 --Interval=0.1 --Window=0.5 --PacketSize=1000 --Filename=100_0.1_1000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3428 --Interval=0.08 --Window=0.5 --PacketSize=1000 --Filename=100_0.08_1000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3429 --Interval=0.04 --Window=0.5 --PacketSize=1000 --Filename=100_0.04_1000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3430 --Interval=0.015 --Window=0.5 --PacketSize=1000 --Filename=100_0.015_1000 --MaxVehicles=100 --SimTime=60" 


