#!/bin/bash

./waf --run "scratch/project-test --Port=3463 --Interval=0.8 --Window=0.5 --PacketSize=2000 --Filename=300_0.8_2000 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3464 --Interval=0.5 --Window=0.5 --PacketSize=2000 --Filename=300_0.5_2000 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3465 --Interval=0.3 --Window=0.5 --PacketSize=2000 --Filename=300_0.3_2000 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3466 --Interval=0.2 --Window=0.5 --PacketSize=2000 --Filename=300_0.2_2000 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3467 --Interval=0.1 --Window=0.5 --PacketSize=2000 --Filename=300_0.1_2000 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3468 --Interval=0.08 --Window=0.5 --PacketSize=2000 --Filename=300_0.08_2000 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3469 --Interval=0.04 --Window=0.5 --PacketSize=2000 --Filename=300_0.04_2000 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3470 --Interval=0.015 --Window=0.5 --PacketSize=2000 --Filename=300_0.015_2000 --MaxVehicles=300 --SimTime=60" &

./waf --run "scratch/project-test --Port=3471 --Interval=0.8 --Window=0.5 --PacketSize=2000 --Filename=400_0.8_2000 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3472 --Interval=0.5 --Window=0.5 --PacketSize=2000 --Filename=400_0.5_2000 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3473 --Interval=0.3 --Window=0.5 --PacketSize=2000 --Filename=400_0.3_2000 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3474 --Interval=0.2 --Window=0.5 --PacketSize=2000 --Filename=400_0.2_2000 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3475 --Interval=0.1 --Window=0.5 --PacketSize=2000 --Filename=400_0.1_2000 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3476 --Interval=0.08 --Window=0.5 --PacketSize=2000 --Filename=400_0.08_2000 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3477 --Interval=0.04 --Window=0.5 --PacketSize=2000 --Filename=400_0.04_2000 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3478 --Interval=0.015 --Window=0.5 --PacketSize=2000 --Filename=400_0.015_2000 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3479 --Interval=0.007 --Window=0.5 --PacketSize=2000 --Filename=400_0.007_2000 --MaxVehicles=400 --SimTime=60" 






