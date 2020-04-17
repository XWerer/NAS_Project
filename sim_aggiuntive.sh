#!/bin/bash

./waf --run "scratch/project-test --Port=3401 --Interval=0.8 --Window=0.5 --PacketSize=500 --Filename=100_0.8_500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3402 --Interval=0.5 --Window=0.5 --PacketSize=500 --Filename=100_0.5_500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3403 --Interval=0.3 --Window=0.5 --PacketSize=500 --Filename=100_0.3_500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3404 --Interval=0.2 --Window=0.5 --PacketSize=500 --Filename=100_0.2_500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3405 --Interval=0.1 --Window=0.5 --PacketSize=500 --Filename=100_0.1_500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3406 --Interval=0.08 --Window=0.5 --PacketSize=500 --Filename=100_0.08_500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3407 --Interval=0.04 --Window=0.5 --PacketSize=500 --Filename=100_0.04_500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3408 --Interval=0.03 --Window=0.5 --PacketSize=500 --Filename=100_0.03_500 --MaxVehicles=100 --SimTime=60" 

./waf --run "scratch/project-test --Port=3409 --Interval=0.8 --Window=0.5 --PacketSize=500 --Filename=200_0.8_500 --MaxVehicles=200 --SimTime=60" &
./waf --run "scratch/project-test --Port=3410 --Interval=0.5 --Window=0.5 --PacketSize=500 --Filename=200_0.5_500 --MaxVehicles=200 --SimTime=60" &
./waf --run "scratch/project-test --Port=3411 --Interval=0.3 --Window=0.5 --PacketSize=500 --Filename=200_0.3_500 --MaxVehicles=200 --SimTime=60" &
./waf --run "scratch/project-test --Port=3412 --Interval=0.2 --Window=0.5 --PacketSize=500 --Filename=200_0.2_500 --MaxVehicles=200 --SimTime=60" &
./waf --run "scratch/project-test --Port=3413 --Interval=0.1 --Window=0.5 --PacketSize=500 --Filename=200_0.1_500 --MaxVehicles=200 --SimTime=60" &
./waf --run "scratch/project-test --Port=3414 --Interval=0.08 --Window=0.5 --PacketSize=500 --Filename=200_0.08_500 --MaxVehicles=200 --SimTime=60" &
./waf --run "scratch/project-test --Port=3415 --Interval=0.015 --Window=0.5 --PacketSize=500 --Filename=200_0.015_500 --MaxVehicles=200 --SimTime=60" 

./waf --run "scratch/project-test --Port=3409 --Interval=0.8 --Window=0.5 --PacketSize=500 --Filename=400_0.8_500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3410 --Interval=0.5 --Window=0.5 --PacketSize=500 --Filename=400_0.5_500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3411 --Interval=0.3 --Window=0.5 --PacketSize=500 --Filename=400_0.3_500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3412 --Interval=0.2 --Window=0.5 --PacketSize=500 --Filename=400_0.2_500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3413 --Interval=0.1 --Window=0.5 --PacketSize=500 --Filename=400_0.1_500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3414 --Interval=0.04 --Window=0.5 --PacketSize=500 --Filename=400_0.04_500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3415 --Interval=0.015 --Window=0.5 --PacketSize=500 --Filename=400_0.015_500 --MaxVehicles=400 --SimTime=60" 



./waf --run "scratch/project-test --Port=3409 --Interval=0.8 --Window=0.5 --PacketSize=1000 --Filename=100_0.8_1000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3410 --Interval=0.5 --Window=0.5 --PacketSize=1000 --Filename=100_0.5_1000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3411 --Interval=0.3 --Window=0.5 --PacketSize=1000 --Filename=100_0.3_1000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3412 --Interval=0.2 --Window=0.5 --PacketSize=1000 --Filename=100_0.2_1000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3413 --Interval=0.1 --Window=0.5 --PacketSize=1000 --Filename=100_0.1_1000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3414 --Interval=0.08 --Window=0.5 --PacketSize=1000 --Filename=100_0.08_1000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3415 --Interval=0.04 --Window=0.5 --PacketSize=1000 --Filename=100_0.04_1000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3416 --Interval=0.015 --Window=0.5 --PacketSize=1000 --Filename=100_0.015_1000 --MaxVehicles=100 --SimTime=60" 



./waf --run "scratch/project-test --Port=3409 --Interval=0.8 --Window=0.5 --PacketSize=1500 --Filename=100_0.8_1500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3410 --Interval=0.5 --Window=0.5 --PacketSize=1500 --Filename=100_0.5_1500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3411 --Interval=0.3 --Window=0.5 --PacketSize=1500 --Filename=100_0.3_1500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3412 --Interval=0.2 --Window=0.5 --PacketSize=1500 --Filename=100_0.2_1500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3413 --Interval=0.1 --Window=0.5 --PacketSize=1500 --Filename=100_0.1_1500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3414 --Interval=0.08 --Window=0.5 --PacketSize=1500 --Filename=100_0.08_1500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3415 --Interval=0.04 --Window=0.5 --PacketSize=1500 --Filename=100_0.04_1500 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3416 --Interval=0.015 --Window=0.5 --PacketSize=1500 --Filename=100_0.015_1500 --MaxVehicles=100 --SimTime=60" 

./waf --run "scratch/project-test --Port=3409 --Interval=0.8 --Window=0.5 --PacketSize=1500 --Filename=300_0.8_1500 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3410 --Interval=0.5 --Window=0.5 --PacketSize=1500 --Filename=300_0.5_1500 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3411 --Interval=0.3 --Window=0.5 --PacketSize=1500 --Filename=300_0.3_1500 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3412 --Interval=0.2 --Window=0.5 --PacketSize=1500 --Filename=300_0.2_1500 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3413 --Interval=0.1 --Window=0.5 --PacketSize=1500 --Filename=300_0.1_1500 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3414 --Interval=0.08 --Window=0.5 --PacketSize=1500 --Filename=300_0.08_1500 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3415 --Interval=0.04 --Window=0.5 --PacketSize=1500 --Filename=300_0.04_1500 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3416 --Interval=0.015 --Window=0.5 --PacketSize=1500 --Filename=300_0.015_1500 --MaxVehicles=300 --SimTime=60" 

./waf --run "scratch/project-test --Port=3409 --Interval=0.8 --Window=0.5 --PacketSize=1500 --Filename=400_0.8_1500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3410 --Interval=0.5 --Window=0.5 --PacketSize=1500 --Filename=400_0.5_1500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3411 --Interval=0.3 --Window=0.5 --PacketSize=1500 --Filename=400_0.3_1500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3412 --Interval=0.2 --Window=0.5 --PacketSize=1500 --Filename=400_0.2_1500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3413 --Interval=0.1 --Window=0.5 --PacketSize=1500 --Filename=400_0.1_1500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3414 --Interval=0.08 --Window=0.5 --PacketSize=1500 --Filename=400_0.08_1500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3415 --Interval=0.04 --Window=0.5 --PacketSize=1500 --Filename=400_0.04_1500 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3416 --Interval=0.015 --Window=0.5 --PacketSize=1500 --Filename=400_0.015_1500 --MaxVehicles=400 --SimTime=60" 



./waf --run "scratch/project-test --Port=3409 --Interval=0.8 --Window=0.5 --PacketSize=2000 --Filename=100_0.8_2000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3410 --Interval=0.5 --Window=0.5 --PacketSize=2000 --Filename=100_0.5_2000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3411 --Interval=0.3 --Window=0.5 --PacketSize=2000 --Filename=100_0.3_2000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3412 --Interval=0.2 --Window=0.5 --PacketSize=2000 --Filename=100_0.2_2000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3413 --Interval=0.1 --Window=0.5 --PacketSize=2000 --Filename=100_0.1_2000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3414 --Interval=0.08 --Window=0.5 --PacketSize=2000 --Filename=100_0.08_2000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3415 --Interval=0.04 --Window=0.5 --PacketSize=2000 --Filename=100_0.04_2000 --MaxVehicles=100 --SimTime=60" &
./waf --run "scratch/project-test --Port=3416 --Interval=0.015 --Window=0.5 --PacketSize=2000 --Filename=100_0.015_2000 --MaxVehicles=100 --SimTime=60" 

./waf --run "scratch/project-test --Port=3409 --Interval=0.8 --Window=0.5 --PacketSize=2000 --Filename=300_0.8_2000 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3410 --Interval=0.5 --Window=0.5 --PacketSize=2000 --Filename=300_0.5_2000 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3411 --Interval=0.3 --Window=0.5 --PacketSize=2000 --Filename=300_0.3_2000 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3412 --Interval=0.2 --Window=0.5 --PacketSize=2000 --Filename=300_0.2_2000 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3413 --Interval=0.1 --Window=0.5 --PacketSize=2000 --Filename=300_0.1_2000 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3414 --Interval=0.08 --Window=0.5 --PacketSize=2000 --Filename=300_0.08_2000 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3415 --Interval=0.04 --Window=0.5 --PacketSize=2000 --Filename=300_0.04_2000 --MaxVehicles=300 --SimTime=60" &
./waf --run "scratch/project-test --Port=3416 --Interval=0.015 --Window=0.5 --PacketSize=2000 --Filename=300_0.015_2000 --MaxVehicles=300 --SimTime=60" 

./waf --run "scratch/project-test --Port=3409 --Interval=0.8 --Window=0.5 --PacketSize=2000 --Filename=400_0.8_2000 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3410 --Interval=0.5 --Window=0.5 --PacketSize=2000 --Filename=400_0.5_2000 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3411 --Interval=0.3 --Window=0.5 --PacketSize=2000 --Filename=400_0.3_2000 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3412 --Interval=0.2 --Window=0.5 --PacketSize=2000 --Filename=400_0.2_2000 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3413 --Interval=0.1 --Window=0.5 --PacketSize=2000 --Filename=400_0.1_2000 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3414 --Interval=0.08 --Window=0.5 --PacketSize=2000 --Filename=400_0.08_2000 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3415 --Interval=0.04 --Window=0.5 --PacketSize=2000 --Filename=400_0.04_2000 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3416 --Interval=0.015 --Window=0.5 --PacketSize=2000 --Filename=400_0.015_2000 --MaxVehicles=400 --SimTime=60" &
./waf --run "scratch/project-test --Port=3417 --Interval=0.007 --Window=0.5 --PacketSize=2000 --Filename=400_0.007_2000 --MaxVehicles=400 --SimTime=60" 






