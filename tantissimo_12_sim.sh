#!/bin/bash

./waf --run "scratch/project-test --Port=3401 --Interval=0.0002 --Window=1 --PacketSize=500 --Filename=300_0.0002_500_20M --MaxVehicles=300 --SimTime=90" &
./waf --run "scratch/project-test --Port=3401 --Interval=0.0004 --Window=1 --PacketSize=1000 --Filename=300_0.0004_1000_20M --MaxVehicles=300 --SimTime=90" &
./waf --run "scratch/project-test --Port=3401 --Interval=0.0008 --Window=1 --PacketSize=2000 --Filename=300_0.0008_2000_20M --MaxVehicles=300 --SimTime=90" &
./waf --run "scratch/project-test --Port=3401 --Interval=0.00025 --Window=1 --PacketSize=500 --Filename=300_0.00025_500_15M --MaxVehicles=300 --SimTime=90" &
./waf --run "scratch/project-test --Port=3401 --Interval=0.0005 --Window=1 --PacketSize=1000 --Filename=300_0.0005_1000_15M --MaxVehicles=300 --SimTime=90" &
./waf --run "scratch/project-test --Port=3401 --Interval=0.001 --Window=1 --PacketSize=2000 --Filename=300_0.001_2000_15M --MaxVehicles=300 --SimTime=90" &
./waf --run "scratch/project-test --Port=3401 --Interval=0.0004 --Window=1 --PacketSize=500 --Filename=300_0.0004_500_10M --MaxVehicles=300 --SimTime=90" &
./waf --run "scratch/project-test --Port=3401 --Interval=0.0008 --Window=1 --PacketSize=1000 --Filename=300_0.0008_1000_10M --MaxVehicles=300 --SimTime=90" &
./waf --run "scratch/project-test --Port=3401 --Interval=0.0016 --Window=1 --PacketSize=2000 --Filename=300_0.0016_2000_10M --MaxVehicles=300 --SimTime=90" &
./waf --run "scratch/project-test --Port=3401 --Interval=0.0008 --Window=1 --PacketSize=500 --Filename=300_0.0008_500_5M --MaxVehicles=300 --SimTime=90" &
./waf --run "scratch/project-test --Port=3401 --Interval=0.0016 --Window=1 --PacketSize=1000 --Filename=300_0.0016_1000_5M --MaxVehicles=300 --SimTime=90" &
./waf --run "scratch/project-test --Port=3401 --Interval=0.0032 --Window=1 --PacketSize=2000 --Filename=300_0.0032_2000_5M --MaxVehicles=300 --SimTime=90" &
