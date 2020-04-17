#!/bin/bash

./waf --run "scratch/project-test --Port=3447 --Interval=0.8 --Window=0.5 --PacketSize=1500 --Filename=400_0.8_1500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3448 --Interval=0.5 --Window=0.5 --PacketSize=1500 --Filename=400_0.5_1500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3449 --Interval=0.3 --Window=0.5 --PacketSize=1500 --Filename=400_0.3_1500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3450 --Interval=0.2 --Window=0.5 --PacketSize=1500 --Filename=400_0.2_1500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3451 --Interval=0.1 --Window=0.5 --PacketSize=1500 --Filename=400_0.1_1500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3452 --Interval=0.08 --Window=0.5 --PacketSize=1500 --Filename=400_0.08_1500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3453 --Interval=0.04 --Window=0.5 --PacketSize=1500 --Filename=400_0.04_1500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3454 --Interval=0.015 --Window=0.5 --PacketSize=1500 --Filename=400_0.015_1500 --MaxVehicles=400 --SimTime=60" &

./waf --run "scratch/project-test --Port=3455 --Interval=0.8 --Window=0.5 --PacketSize=2000 --Filename=100_0.8_2000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3456 --Interval=0.5 --Window=0.5 --PacketSize=2000 --Filename=100_0.5_2000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3457 --Interval=0.3 --Window=0.5 --PacketSize=2000 --Filename=100_0.3_2000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3458 --Interval=0.2 --Window=0.5 --PacketSize=2000 --Filename=100_0.2_2000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3459 --Interval=0.1 --Window=0.5 --PacketSize=2000 --Filename=100_0.1_2000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3460 --Interval=0.08 --Window=0.5 --PacketSize=2000 --Filename=100_0.08_2000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3461 --Interval=0.04 --Window=0.5 --PacketSize=2000 --Filename=100_0.04_2000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3462 --Interval=0.015 --Window=0.5 --PacketSize=2000 --Filename=100_0.015_2000 --MaxVehicles=100 --SimTime=60" 



