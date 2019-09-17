#!/bin/bash
python "$SUMO_HOME/tools/randomTrips.py" -n osm.net.xml --seed 42 --fringe-factor 500 -p 0.280808 -o osm.passenger.trips.xml -e 3600 --vehicle-class passenger --vclass passenger --prefix veh --min-distance 300 --trip-attributes 'departLane="best"' --fringe-start-attributes 'departSpeed="max"' --allow-fringe.min-length 1000 --lanes --validate
