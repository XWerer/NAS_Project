#runs = [3400 3401 3402 3403 3404 3405 3406 3407 3408 3409 3410 3411 3412 3413 3414] #sia numero di run che identificatore del port
#runs = 15 #sia numero di run che identificatore del port

for pkt in 250 500
do
  for vh in 50
  do
    for i in 1.0 0.5
    do
      for prj in True False
      do
        for run in $(seq 3400 1 3401)
        do
          filename="${vh}_${pkt}_${i}_${prj}_${run}"
          echo $filename
          ./waf --run "scratch/project-test --RngRun=$run --Port=$run --Interval=$i --Window=0.5 --PacketSize=$pkt --MaxVehicles=$vh --Project1=$prj --Project2=$prj --Filename=$filename --SimTime=10" &
        done
        filename="${vh}_${pkt}_${i}_${prj}_3402"
        echo $filename
        ./waf --run "scratch/project-test --RngRun=3402 --Port=3402 --Interval=$i --Window=0.5 --PacketSize=$pkt --MaxVehicles=$vh --Project1=$prj --Project2=$prj --Filename=$filename --SimTime=10" 
      done
    done
  done
done
