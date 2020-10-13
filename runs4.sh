#runs = [3400 3401 3402 3403 3404 3405 3406 3407 3408 3409 3410 3411 3412 3413 3414] #sia numero di run che identificatore del port
#runs = 15 #sia numero di run che identificatore del port

for vh in 100 250 400
do
  for i in 0.1 0.07 0.03 0.01
  do
    for prj_int in True False
    do
      for prj_rer in True False
      do
        for time_win in 1 2 4
        do
          for soft_th in 0.5 1.0 1.5
          do
            for hard_th in 1.8 2.3 2.8
            do
              for run in $(seq 3400 1 3413)
              do
                filename="${vh}_${i}_${prj_int}_${prj_rer}_${time_win}_${soft_th}_${hard_th}_${run}"
                #echo $filename
                ./waf --run "scratch/project-test --RngRun=$run --Port=$run --Interval=$i --Window=0.5 --PacketSize=1400 --MaxVehicles=$vh --Project1=$prj_int --Project2=$prj_rer --TimeWindow=$time_win --Soft=$soft_th --Hard=$hard_th --Filename=$filename --SimTime=90" &
              done
              filename="${vh}_${i}_${prj_int}_${prj_rer}_${time_win}_${soft_th}_${hard_th}_3414"
              #echo $filename
              ./waf --run "scratch/project-test --RngRun=3414 --Port=3414 --Interval=$i --Window=0.5 --PacketSize=1400 --MaxVehicles=$vh --Project1=$prj_int --Project2=$prj_rer --TimeWindow=$time_win --Soft=$soft_th --Hard=$hard_th --Filename=$filename --SimTime=90" 
      	    done
      	  done  
      	done
      done
    done
  done
done
