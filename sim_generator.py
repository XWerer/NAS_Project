#!/usr/bin/env python3
from string import Template

filename = "runs.sh"
myfile = open(filename, 'w')

ports = ["3400", "3401", "3402", "3403", "3404", "3405", "3406", "3407", "3408", "3409", "3410", "3411", "3412", "3413", "3414"]
packet_sizes = ["250", "500", "750", "1000", "1250", "1500", "1750", "2000", "2250", "2500", "3000"]
vehicles = ["10", "20", "30", "40", "50", "75", "100", "125", "150", "175", "200", "225", "250", "275", "300", "325", "350", "375", "400", "425", "450", "475", "500", "550", "600"]
intervals = ["1.0", "0.9", "0.8", "0.7", "0.6", "0.5", "0.4", "0.3", "0.2", "0.1", "0.09", "0.08", "0.07", "0.06", "0.05", "0.04", "0.03", "0.02", "0.01"]
projects = ["True", "False"]
#project2s = ["True", "False"]

template = ("./waf --run \"scratch/project-test " 
           "--Port={} " 
           "--Interval={} "  
           "--Window=0.5 "  
           "--PacketSize={} " 
           "--MaxVehicles={} " 
           "--Project1={} " 
           "--Project2={} " 
           "--Filename={}_{}_{}_{}_{}_{} "  
           "--SimTime=90\" ")

for vehicle in vehicles:
    for size in packet_sizes:  
        for interval in intervals: 
            for p in projects: 
                for port in ports:  
                    line = template.format(port, interval, size, vehicle, p, p, vehicle, size, interval, p, p, port)
                    #print(line)
                    if port != ports[-1]:
                        line = line + "& \nsleep 3 \n"
                    else:
                        line = line + "\n"    
                    myfile.write(line)
                    
myfile.close()
