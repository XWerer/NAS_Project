#!/bin/bash

./waf --run "scratch/project-test --Port=3431 --Interval=0.8 --Window=0.5 --PacketSize=1500 --Filename=100_0.8_1500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3432 --Interval=0.5 --Window=0.5 --PacketSize=1500 --Filename=100_0.5_1500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3433 --Interval=0.3 --Window=0.5 --PacketSize=1500 --Filename=100_0.3_1500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3434 --Interval=0.2 --Window=0.5 --PacketSize=1500 --Filename=100_0.2_1500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3435 --Interval=0.1 --Window=0.5 --PacketSize=1500 --Filename=100_0.1_1500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3436 --Interval=0.08 --Window=0.5 --PacketSize=1500 --Filename=100_0.08_1500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3437 --Interval=0.04 --Window=0.5 --PacketSize=1500 --Filename=100_0.04_1500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3438 --Interval=0.015 --Window=0.5 --PacketSize=1500 --Filename=100_0.015_1500 --MaxVehicles=100 --SimTime=60" &

./waf --run "scratch/project-test --Port=3439 --Interval=0.8 --Window=0.5 --PacketSize=1500 --Filename=300_0.8_1500 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3440 --Interval=0.5 --Window=0.5 --PacketSize=1500 --Filename=300_0.5_1500 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3441 --Interval=0.3 --Window=0.5 --PacketSize=1500 --Filename=300_0.3_1500 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3442 --Interval=0.2 --Window=0.5 --PacketSize=1500 --Filename=300_0.2_1500 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3443 --Interval=0.1 --Window=0.5 --PacketSize=1500 --Filename=300_0.1_1500 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3444 --Interval=0.08 --Window=0.5 --PacketSize=1500 --Filename=300_0.08_1500 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3445 --Interval=0.04 --Window=0.5 --PacketSize=1500 --Filename=300_0.04_1500 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3446 --Interval=0.015 --Window=0.5 --PacketSize=1500 --Filename=300_0.015_1500 --MaxVehicles=300 --SimTime=60" 
