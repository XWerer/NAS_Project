%% setup
clearvars;
clc; 

filename = "50veh-all_standard";
filename2 = "50veh-true-false";
filename3 = "50veh-false-true";
filename4 = "50veh-false-false";
filename5 = "100veh-all_standard";
filename6 = "100veh-true-false";
filename7 = "100veh-false-true";
filename8 = "100veh-false-false";
filename9 = "150veh-all_standard";
filename10 = "150veh-true-false";
filename11 = "150veh-false-true";
filename12 = "150veh-false-false";
filename13 = "200veh-all_standard";
filename14 = "200veh-true-false";
filename15 = "200veh-false-true";
filename16 = "200veh-false-false";

%reading csv file and taking the time intervals involved
m = readtable(filename + '.csv');
m2 = readtable(filename2 + '.csv');
m3 = readtable(filename3 + '.csv');
m4 = readtable(filename4 + '.csv');
m5 = readtable(filename5 + '.csv');
m6 = readtable(filename6 + '.csv');
m7 = readtable(filename7 + '.csv');
m8 = readtable(filename8 + '.csv');
m9 = readtable(filename9 + '.csv');
m10 = readtable(filename10 + '.csv');
m11 = readtable(filename11 + '.csv');
m12 = readtable(filename12 + '.csv');
m13 = readtable(filename13 + '.csv');
m14 = readtable(filename14 + '.csv');
m15 = readtable(filename15 + '.csv');
m16 = readtable(filename16 + '.csv');

time = table2array(unique(m(:,1)));

%% calculation on all vehicles
%arrays for thr calculation - mean and variance
thr = zeros(size(time, 1), 1);
thr_s = zeros(1, 1);
thr2 = zeros(size(time, 1), 1);
thr_s2 = zeros(1, 1);
thr3 = zeros(size(time, 1), 1);
thr_s3 = zeros(1, 1);
thr4 = zeros(size(time, 1), 1);
thr_s4 = zeros(1, 1);
thr5 = zeros(size(time, 1), 1);
thr_s5 = zeros(1, 1);
thr6 = zeros(size(time, 1), 1);
thr_s6 = zeros(1, 1);
thr7 = zeros(size(time, 1), 1);
thr_s7 = zeros(1, 1);
thr8 = zeros(size(time, 1), 1);
thr_s8 = zeros(1, 1);
thr9 = zeros(size(time, 1), 1);
thr_s9 = zeros(1, 1);
thr10 = zeros(size(time, 1), 1);
thr_s10 = zeros(1, 1);
thr11 = zeros(size(time, 1), 1);
thr_s11 = zeros(1, 1);
thr12 = zeros(size(time, 1), 1);
thr_s12 = zeros(1, 1);
thr13 = zeros(size(time, 1), 1);
thr_s13 = zeros(1, 1);
thr14 = zeros(size(time, 1), 1);
thr_s14 = zeros(1, 1);
thr15 = zeros(size(time, 1), 1);
thr_s15 = zeros(1, 1);
thr16 = zeros(size(time, 1), 1);
thr_s16 = zeros(1, 1);

%arrays for mean delay calculation
delay = zeros(size(time, 1), 1);
delay_s = zeros(1, 1);
delay2 = zeros(size(time, 1), 1);
delay_s2 = zeros(1, 1);
delay3 = zeros(size(time, 1), 1);
delay_s3 = zeros(1, 1);
delay4 = zeros(size(time, 1), 1);
delay_s4 = zeros(1, 1);
delay5 = zeros(size(time, 1), 1);
delay_s5 = zeros(1, 1);
delay6 = zeros(size(time, 1), 1);
delay_s6 = zeros(1, 1);
delay7 = zeros(size(time, 1), 1);
delay_s7 = zeros(1, 1);
delay8 = zeros(size(time, 1), 1);
delay_s8 = zeros(1, 1);
delay9 = zeros(size(time, 1), 1);
delay_s9 = zeros(1, 1);
delay10 = zeros(size(time, 1), 1);
delay_s10 = zeros(1, 1);
delay11 = zeros(size(time, 1), 1);
delay_s11 = zeros(1, 1);
delay12 = zeros(size(time, 1), 1);
delay_s12 = zeros(1, 1);
delay13 = zeros(size(time, 1), 1);
delay_s13 = zeros(1, 1);
delay14 = zeros(size(time, 1), 1);
delay_s14 = zeros(1, 1);
delay15 = zeros(size(time, 1), 1);
delay_s15 = zeros(1, 1);
delay16 = zeros(size(time, 1), 1);
delay_s16 = zeros(1, 1);

%arrays for mean packet loss calculation
pl = zeros(size(time, 1), 1);
pl_s = zeros(1, 1);
pl2 = zeros(size(time, 1), 1);
pl_s2 = zeros(1, 1);
pl3 = zeros(size(time, 1), 1);
pl_s3 = zeros(1, 1);
pl4 = zeros(size(time, 1), 1);
pl_s4 = zeros(1, 1);
pl5 = zeros(size(time, 1), 1);
pl_s5 = zeros(1, 1);
pl6 = zeros(size(time, 1), 1);
pl_s6 = zeros(1, 1);
pl7 = zeros(size(time, 1), 1);
pl_s7 = zeros(1, 1);
pl8 = zeros(size(time, 1), 1);
pl_s8 = zeros(1, 1);
pl9 = zeros(size(time, 1), 1);
pl_s9 = zeros(1, 1);
pl10 = zeros(size(time, 1), 1);
pl_s10 = zeros(1, 1);
pl11 = zeros(size(time, 1), 1);
pl_s11 = zeros(1, 1);
pl12 = zeros(size(time, 1), 1);
pl_s12 = zeros(1, 1);
pl13 = zeros(size(time, 1), 1);
pl_s13 = zeros(1, 1);
pl14 = zeros(size(time, 1), 1);
pl_s14 = zeros(1, 1);
pl15 = zeros(size(time, 1), 1);
pl_s15 = zeros(1, 1);
pl16 = zeros(size(time, 1), 1);
pl_s16 = zeros(1, 1);

first = true;   
for i=1:size(time, 1)
    first = true;
    for j=1:size(m, 1)
        if time(i, :) == m{j, 1}
            if first
                %saving stats
                thr_s(1) = m{j, 3};             %thr
                delay_s(1) = m{j, 6};           %delay
                if m{j, 13} ~= -1           
                    pl_s = m{j, 13};            %if there are packets, packet loss
                end
                first = false;
            else
                delay_s = [delay_s m{j, 6}];    %same here
                thr_s = [thr_s m{j, 3}];
                if m{j, 13} ~= -1
                    pl_s = [pl_s m{j, 13}];
                end
            end
        end
    end
    %calculating stats per time instant
    thr(i, 1) = mean(thr_s);
    delay(i, 1) = mean(delay_s);
    pl(i, 1) = mean(pl_s);
    
    %zeroing temporary arrays for further analysis
    thr_s = zeros(1, 1);
    delay_s = zeros(1, 1);
    pl_s = zeros(1, 1);
end

disp("First done");

first = true;   
for i=1:size(time, 1)
    first = true;
    for j=1:size(m2, 1)
        if time(i, :) == m2{j, 1}
            if first
                %saving stats
                thr_s2(1) = m2{j, 3};             %thr
                delay_s2(1) = m2{j, 6};           %delay
                if m2{j, 13} ~= -1           
                    pl_s2 = m2{j, 13};            %if there are packets, packet loss
                end
                first = false;
            else
                delay_s2 = [delay_s2 m2{j, 6}];    %same here
                thr_s2 = [thr_s2 m2{j, 3}];
                if m2{j, 13} ~= -1
                    pl_s2 = [pl_s2 m2{j, 13}];
                end
            end
        end
    end
    %calculating stats per time instant
    thr2(i, 1) = mean(thr_s2);
    delay2(i, 1) = mean(delay_s2);
    pl2(i, 1) = mean(pl_s2);
    
    %zeroing temporary arrays for further analysis
    thr_s2 = zeros(1, 1);
    delay_s2 = zeros(1, 1);
    pl_s2 = zeros(1, 1);
end

disp("Second done");

first = true;   
for i=1:size(time, 1)
    first = true;
    for j=1:size(m3, 1)
        if time(i, :) == m3{j, 1}
            if first
                %saving stats
                thr_s3(1) = m3{j, 3};             %thr
                delay_s3(1) = m3{j, 6};           %delay
                if m3{j, 13} ~= -1           
                    pl_s3 = m3{j, 13};            %if there are packets, packet loss
                end
                first = false;
            else
                delay_s3 = [delay_s3 m3{j, 6}];    %same here
                thr_s3 = [thr_s3 m3{j, 3}];
                if m3{j, 13} ~= -1
                    pl_s3 = [pl_s3 m3{j, 13}];
                end
            end
        end
    end
    %calculating stats per time instant
    thr3(i, 1) = mean(thr_s3);
    delay3(i, 1) = mean(delay_s3);
    pl3(i, 1) = mean(pl_s3);
    
    %zeroing temporary arrays for further analysis
    thr_s3 = zeros(1, 1);
    delay_s3 = zeros(1, 1);
    pl_s3 = zeros(1, 1);
end

disp("Third done");

first = true;   
for i=1:size(time, 1)
    first = true;
    for j=1:size(m4, 1)
        if time(i, :) == m4{j, 1}
            if first
                %saving stats
                thr_s4(1) = m4{j, 3};             %thr
                delay_s4(1) = m4{j, 6};           %delay
                if m4{j, 13} ~= -1           
                    pl_s4 = m4{j, 13};            %if there are packets, packet loss
                end
                first = false;
            else
                delay_s4 = [delay_s4 m4{j, 6}];    %same here
                thr_s4 = [thr_s4 m4{j, 3}];
                if m4{j, 13} ~= -1
                    pl_s4 = [pl_s4 m4{j, 13}];
                end
            end
        end
    end
    %calculating stats per time instant
    thr4(i, 1) = mean(thr_s4);
    delay4(i, 1) = mean(delay_s4);
    pl4(i, 1) = mean(pl_s4);
    
    %zeroing temporary arrays for further analysis
    thr_s4 = zeros(1, 1);
    delay_s4 = zeros(1, 1);
    pl_s4 = zeros(1, 1);
end

disp("Fourth done");

first = true;   
for i=1:size(time, 1)
    first = true;
    for j=1:size(m5, 1)
        if time(i, :) == m5{j, 1}
            if first
                %saving stats
                thr_s5(1) = m5{j, 3};             %thr
                delay_s5(1) = m5{j, 6};           %delay
                if m5{j, 13} ~= -1           
                    pl_s5 = m5{j, 13};            %if there are packets, packet loss
                end
                first = false;
            else
                delay_s5 = [delay_s5 m5{j, 6}];    %same here
                thr_s5 = [thr_s5 m5{j, 3}];
                if m5{j, 13} ~= -1
                    pl_s5 = [pl_s5 m5{j, 13}];
                end
            end
        end
    end
    %calculating stats per time instant
    thr5(i, 1) = mean(thr_s5);
    delay5(i, 1) = mean(delay_s5);
    pl5(i, 1) = mean(pl_s5);
    
    %zeroing temporary arrays for further analysis
    thr_s5 = zeros(1, 1);
    delay_s5 = zeros(1, 1);
    pl_s5 = zeros(1, 1);
end

disp("Fifth done");

first = true;   
for i=1:size(time, 1)
    first = true;
    for j=1:size(m6, 1)
        if time(i, :) == m6{j, 1}
            if first
                %saving stats
                thr_s6(1) = m6{j, 3};             %thr
                delay_s6(1) = m6{j, 6};           %delay
                if m6{j, 13} ~= -1           
                    pl_s6 = m6{j, 13};            %if there are packets, packet loss
                end
                first = false;
            else
                delay_s6 = [delay_s6 m6{j, 6}];    %same here
                thr_s6 = [thr_s6 m6{j, 3}];
                if m6{j, 13} ~= -1
                    pl_s6 = [pl_s6 m6{j, 13}];
                end
            end
        end
    end
    %calculating stats per time instant
    thr6(i, 1) = mean(thr_s6);
    delay6(i, 1) = mean(delay_s6);
    pl6(i, 1) = mean(pl_s6);
    
    %zeroing temporary arrays for further analysis
    thr_s6 = zeros(1, 1);
    delay_s6 = zeros(1, 1);
    pl_s6 = zeros(1, 1);
end

disp("Sixth done");

first = true;   
for i=1:size(time, 1)
    first = true;
    for j=1:size(m7, 1)
        if time(i, :) == m7{j, 1}
            if first
                %saving stats
                thr_s7(1) = m7{j, 3};             %thr
                delay_s7(1) = m7{j, 6};           %delay
                if m7{j, 13} ~= -1           
                    pl_s7 = m7{j, 13};            %if there are packets, packet loss
                end
                first = false;
            else
                delay_s7 = [delay_s7 m7{j, 6}];    %same here
                thr_s7 = [thr_s7 m7{j, 3}];
                if m7{j, 13} ~= -1
                    pl_s7 = [pl_s7 m7{j, 13}];
                end
            end
        end
    end
    %calculating stats per time instant
    thr7(i, 1) = mean(thr_s7);
    delay7(i, 1) = mean(delay_s7);
    pl7(i, 1) = mean(pl_s7);
    
    %zeroing temporary arrays for further analysis
    thr_s7 = zeros(1, 1);
    delay_s7 = zeros(1, 1);
    pl_s7 = zeros(1, 1);
end

disp("Seventh done");

first = true;   
for i=1:size(time, 1)
    first = true;
    for j=1:size(m8, 1)
        if time(i, :) == m8{j, 1}
            if first
                %saving stats
                thr_s8(1) = m8{j, 3};             %thr
                delay_s8(1) = m8{j, 6};           %delay
                if m8{j, 13} ~= -1           
                    pl_s8 = m8{j, 13};            %if there are packets, packet loss
                end
                first = false;
            else
                delay_s8 = [delay_s8 m8{j, 6}];    %same here
                thr_s8 = [thr_s8 m8{j, 3}];
                if m8{j, 13} ~= -1
                    pl_s8 = [pl_s8 m8{j, 13}];
                end
            end
        end
    end
    %calculating stats per time instant
    thr8(i, 1) = mean(thr_s8);
    delay8(i, 1) = mean(delay_s8);
    pl8(i, 1) = mean(pl_s8);
    
    %zeroing temporary arrays for further analysis
    thr_s8 = zeros(1, 1);
    delay_s8 = zeros(1, 1);
    pl_s8 = zeros(1, 1);
end

disp("Eight done");

first = true;   
for i=1:size(time, 1)
    first = true;
    for j=1:size(m9, 1)
        if time(i, :) == m9{j, 1}
            if first
                %saving stats
                thr_s9(1) = m9{j, 3};             %thr
                delay_s9(1) = m9{j, 6};           %delay
                if m9{j, 13} ~= -1           
                    pl_s9 = m9{j, 13};            %if there are packets, packet loss
                end
                first = false;
            else
                delay_s9 = [delay_s9 m9{j, 6}];    %same here
                thr_s9 = [thr_s9 m9{j, 3}];
                if m9{j, 13} ~= -1
                    pl_s9 = [pl_s9 m9{j, 13}];
                end
            end
        end
    end
    %calculating stats per time instant
    thr9(i, 1) = mean(thr_s9);
    delay9(i, 1) = mean(delay_s9);
    pl9(i, 1) = mean(pl_s9);
    
    %zeroing temporary arrays for further analysis
    thr_s9 = zeros(1, 1);
    delay_s9 = zeros(1, 1);
    pl_s9 = zeros(1, 1);
end

disp("Nineth done");

first = true;   
for i=1:size(time, 1)
    first = true;
    for j=1:size(m10, 1)
        if time(i, :) == m10{j, 1}
            if first
                %saving stats
                thr_s10(1) = m10{j, 3};             %thr
                delay_s10(1) = m10{j, 6};           %delay
                if m10{j, 13} ~= -1           
                    pl_s10 = m10{j, 13};            %if there are packets, packet loss
                end
                first = false;
            else
                delay_s10 = [delay_s10 m10{j, 6}];    %same here
                thr_s10 = [thr_s10 m10{j, 3}];
                if m10{j, 13} ~= -1
                    pl_s10 = [pl_s10 m10{j, 13}];
                end
            end
        end
    end
    %calculating stats per time instant
    thr10(i, 1) = mean(thr_s10);
    delay10(i, 1) = mean(delay_s10);
    pl10(i, 1) = mean(pl_s10);
    
    %zeroing temporary arrays for further analysis
    thr_s10 = zeros(1, 1);
    delay_s10 = zeros(1, 1);
    pl_s10 = zeros(1, 1);
end

disp("Tenth done");

first = true;   
for i=1:size(time, 1)
    first = true;
    for j=1:size(m11, 1)
        if time(i, :) == m11{j, 1}
            if first
                %saving stats
                thr_s11(1) = m11{j, 3};             %thr
                delay_s1(1) = m11{j, 6};           %delay
                if m11{j, 13} ~= -1           
                    pl_s11 = m11{j, 13};            %if there are packets, packet loss
                end
                first = false;
            else
                delay_s11 = [delay_s11 m11{j, 6}];    %same here
                thr_s11 = [thr_s11 m11{j, 3}];
                if m11{j, 13} ~= -1
                    pl_s11 = [pl_s11 m11{j, 13}];
                end
            end
        end
    end
    %calculating stats per time instant
    thr11(i, 1) = mean(thr_s11);
    delay11(i, 1) = mean(delay_s11);
    pl11(i, 1) = mean(pl_s11);
    
    %zeroing temporary arrays for further analysis
    thr_s11 = zeros(1, 1);
    delay_s11 = zeros(1, 1);
    pl_s11 = zeros(1, 1);
end

disp("11th done");

first = true;   
for i=1:size(time, 1)
    first = true;
    for j=1:size(m12, 1)
        if time(i, :) == m12{j, 1}
            if first
                %saving stats
                thr_s12(1) = m12{j, 3};             %thr
                delay_s12(1) = m12{j, 6};           %delay
                if m12{j, 13} ~= -1           
                    pl_s12 = m12{j, 13};            %if there are packets, packet loss
                end
                first = false;
            else
                delay_s12 = [delay_s12 m12{j, 6}];    %same here
                thr_s12 = [thr_s12 m12{j, 3}];
                if m12{j, 13} ~= -1
                    pl_s12 = [pl_s12 m12{j, 13}];
                end
            end
        end
    end
    %calculating stats per time instant
    thr12(i, 1) = mean(thr_s12);
    delay12(i, 1) = mean(delay_s12);
    pl12(i, 1) = mean(pl_s12);
    
    %zeroing temporary arrays for further analysis
    thr_s12 = zeros(1, 1);
    delay_s12 = zeros(1, 1);
    pl_s12 = zeros(1, 1);
end

disp("12th done");

first = true;   
for i=1:size(time, 1)
    first = true;
    for j=1:size(m13, 1)
        if time(i, :) == m13{j, 1}
            if first
                %saving stats
                thr_s13(1) = m13{j, 3};             %thr
                delay_s13(1) = m13{j, 6};           %delay
                if m13{j, 13} ~= -1           
                    pl_s13 = m13{j, 13};            %if there are packets, packet loss
                end
                first = false;
            else
                delay_s13 = [delay_s13 m13{j, 6}];    %same here
                thr_s13 = [thr_s13 m13{j, 3}];
                if m13{j, 13} ~= -1
                    pl_s13 = [pl_s13 m13{j, 13}];
                end
            end
        end
    end
    %calculating stats per time instant
    thr13(i, 1) = mean(thr_s13);
    delay13(i, 1) = mean(delay_s13);
    pl13(i, 1) = mean(pl_s13);
    
    %zeroing temporary arrays for further analysis
    thr_s13 = zeros(1, 1);
    delay_s13 = zeros(1, 1);
    pl_s13 = zeros(1, 1);
end

disp("13th done");

first = true;   
for i=1:size(time, 1)
    first = true;
    for j=1:size(m14, 1)
        if time(i, :) == m14{j, 1}
            if first
                %saving stats
                thr_s14(1) = m14{j, 3};             %thr
                delay_s14(1) = m14{j, 6};           %delay
                if m14{j, 13} ~= -1           
                    pl_s14 = m14{j, 13};            %if there are packets, packet loss
                end
                first = false;
            else
                delay_s14 = [delay_s14 m14{j, 6}];    %same here
                thr_s14 = [thr_s14 m14{j, 3}];
                if m14{j, 13} ~= -1
                    pl_s14 = [pl_s14 m14{j, 13}];
                end
            end
        end
    end
    %calculating stats per time instant
    thr14(i, 1) = mean(thr_s14);
    delay14(i, 1) = mean(delay_s14);
    pl14(i, 1) = mean(pl_s14);
    
    %zeroing temporary arrays for further analysis
    thr_s14 = zeros(1, 1);
    delay_s14 = zeros(1, 1);
    pl_s14 = zeros(1, 1);
end

disp("14th done");

first = true;   
for i=1:size(time, 1)
    first = true;
    for j=1:size(m15, 1)
        if time(i, :) == m15{j, 1}
            if first
                %saving stats
                thr_s15(1) = m15{j, 3};             %thr
                delay_s15(1) = m15{j, 6};           %delay
                if m15{j, 13} ~= -1           
                    pl_s15 = m15{j, 13};            %if there are packets, packet loss
                end
                first = false;
            else
                delay_s15 = [delay_s15 m15{j, 6}];    %same here
                thr_s15 = [thr_s15 m15{j, 3}];
                if m15{j, 13} ~= -1
                    pl_s15 = [pl_s15 m15{j, 13}];
                end
            end
        end
    end
    %calculating stats per time instant
    thr15(i, 1) = mean(thr_s15);
    delay15(i, 1) = mean(delay_s15);
    pl15(i, 1) = mean(pl_s15);
    
    %zeroing temporary arrays for further analysis
    thr_s15 = zeros(1, 1);
    delay_s15 = zeros(1, 1);
    pl_s15 = zeros(1, 1);
end

disp("15th done");

first = true;   
for i=1:size(time, 1)
    first = true;
    for j=1:size(m16, 1)
        if time(i, :) == m16{j, 1}
            if first
                %saving stats
                thr_s16(1) = m16{j, 3};             %thr
                delay_s16(1) = m16{j, 6};           %delay
                if m16{j, 13} ~= -1           
                    pl_s16 = m16{j, 13};            %if there are packets, packet loss
                end
                first = false;
            else
                delay_s16 = [delay_s16 m16{j, 6}];    %same here
                thr_s16 = [thr_s16 m16{j, 3}];
                if m16{j, 13} ~= -1
                    pl_s16 = [pl_s16 m16{j, 13}];
                end
            end
        end
    end
    %calculating stats per time instant
    thr16(i, 1) = mean(thr_s16);
    delay16(i, 1) = mean(delay_s16);
    pl16(i, 1) = mean(pl_s16);
    
    %zeroing temporary arrays for further analysis
    thr_s16 = zeros(1, 1);
    delay_s16 = zeros(1, 1);
    pl_s16 = zeros(1, 1);
end

disp("16th done");

%% PLOTS FOR WIN SIZE

save('thr-WS.mat', 'thr');
save('thr2-WS.mat', 'thr2');
save('thr3-WS.mat', 'thr3');
save('thr4-WS.mat', 'thr4');
save('thr5-WS.mat', 'thr5');
save('delay-WS.mat', 'delay');
save('delay2-WS.mat', 'delay2');
save('delay3-WS.mat', 'delay3');
save('delay4-WS.mat', 'delay4');
save('delay5-WS.mat', 'delay5');
save('pl-WS.mat', 'pl');
save('pl2-WS.mat', 'pl2');
save('pl3-WS.mat', 'pl3');
save('pl4-WS.mat', 'pl4');
save('pl5-WS.mat', 'pl5');

%plots and image savings
%totalfig = figure;
fig = figure;
plot(time(:, 1), thr);
hold on;
plot(time(:, 1), thr2, 'r');
plot(time(:, 1), thr3, 'g');
plot(time(:, 1), thr4, 'k');
plot(time(:, 1), thr5, 'm');
title('Mean throughput per window size');
ylabel('Throughput - Mbps'); 
xlabel('Time - s'); 
grid on;
legend({'w: 1', 'w: 2', 'w: 3', 'w: 4', 'w: 8'}, 'Location', "South", 'NumColumns', 2);
saveas(fig, "Compare throughput per window size.jpg");

fig2 = figure;
plot(time(:, 1), delay);
hold on;
plot(time(:, 1), delay2, 'r');
plot(time(:, 1), delay3, 'g');
plot(time(:, 1), delay4, 'k');
plot(time(:, 1), delay5, 'm');
title('Mean delay per window size');
ylabel('Delay - us'); 
xlabel('Time - s'); 
grid on;
legend({'w: 1', 'w: 2', 'w: 3', 'w: 4', 'w: 8'}, 'Location', "South", 'NumColumns', 2);
saveas(fig2, "Compare delay per window size.jpg");

fig3 = figure;
plot(time(:, 1), pl);
hold on;
plot(time(:, 1), pl2, 'r');
plot(time(:, 1), pl3, 'g');
plot(time(:, 1), pl4, 'k');
plot(time(:, 1), pl5, 'm');
title('Mean packet loss per window size');
ylabel('Packet loss - rate'); 
xlabel('Time - s'); 
grid on;
legend({'w: 1', 'w: 2', 'w: 3', 'w: 4', 'w: 8'}, 'Location', "South", 'NumColumns', 2);
saveas(fig3, "Compare packet loss per window size.jpg");
%saveas(totalfig, "Compare packet loss per time " + filename + " " + filename2 + " " + filename3 + " " + filename4 + " TOTAL.jpg");

%% PLOT FOR HUGE COMPARE
load('Tthr.mat');
load('Tdelay.mat');
load('Tpl.mat');
%Tthr = [mean(thr) mean(thr2) mean(thr3) mean(thr4) mean(thr5) mean(thr6) mean(thr7)];
%Tdelay = [mean(delay) mean(delay2) mean(delay3) mean(delay4) mean(delay5) mean(delay6) mean(delay7)];
%Tpl = [mean(pl) mean(pl2) mean(pl3) mean(pl4) mean(pl5) mean(pl6) mean(pl7)];
save('Tthr.mat', 'Tthr');
save('Tdelay.mat', 'Tdelay');
save('Tpl.mat', 'Tpl');

x = [50 75 100 125 150 175 200];

fig = figure;
plot(x, Tthr);
title('Mean throughput vs # of vehicles');
ylabel('Throughput - Mbps'); 
xlabel('# of vehicles'); 
grid minor;
saveas(fig, "Mean throughput vs # of vehicles.jpg");

fig2 = figure;
plot(x, Tdelay, 'r');
title('Mean delay vs # of vehicles');
ylabel('Delay - us'); 
xlabel('# of vehicles'); 
grid minor;
saveas(fig2, "Mean delay vs # of vehicles.jpg");

fig3 = figure;
plot(x, Tpl, 'g');
title('Mean packet loss vs # of vehicles');
ylabel('Packet loss - Rate'); 
xlabel('# of vehicles'); 
grid minor;
saveas(fig3, "Mean packet loss vs # of vehicles.jpg");

%% PLOTS FOR TT-TF-FT-FF
% save('thr-TTFF.mat', 'thr');
% save('thr2-TTFF.mat', 'thr2');
% save('thr3-TTFF.mat', 'thr3');
% save('thr4-TTFF.mat', 'thr4');
% save('delay-TTFF.mat', 'delay');
% save('delay2-TTFF.mat', 'delay2');
% save('delay3-TTFF.mat', 'delay3');
% save('delay4-TTFF.mat', 'delay4');
% save('pl-TTFF.mat', 'pl');
% save('pl2-TTFF.mat', 'pl2');
% save('pl3-TTFF.mat', 'pl3');
% save('pl4-TTFF.mat', 'pl4');

TTFFthr = [mean(thr) mean(thr2) mean(thr3) mean(thr4)];
TTFFdelay = [mean(delay) mean(delay2) mean(delay3) mean(delay4)];
TTFFpl = [mean(pl) mean(pl2) mean(pl3) mean(pl4)];
save('TTFFthr.mat', 'TTFFthr');
save('TTFFdelay.mat', 'TTFFdelay');
save('TTFFpl.mat', 'TTFFpl');

x = ['TT'; 'TF'; 'FT'; 'FF'];

fig = figure;
bar(TTFFthr);
set(gca,'xticklabel', x);
title('Mean throughput vs project');
ylabel('Throughput - Mbps'); 
xlabel('Combination of strategies'); 
grid minor;
saveas(fig, "Mean throughput vs project.jpg");

fig2 = figure;
bar(TTFFdelay, 'r');
set(gca,'xticklabel', x);
title('Mean delay vs project');
ylabel('Delay - us'); 
xlabel('Combination of strategies'); 
grid minor;
saveas(fig2, "Mean delay vs project.jpg");

fig3 = figure;
bar(TTFFpl, 'g');
set(gca,'xticklabel', x);
title('Mean packet loss vs project');
ylabel('Packet loss - Rate'); 
xlabel('Combination of strategies'); 
xTicks = ["TT"; "TF"; "FT"; "FF"];
grid minor;
saveas(fig3, "Mean packet loss vs project.jpg");

%% PLOTS FOR THR AGGRESSIVENESS

save('thr-TH.mat', 'thr');
save('thr2-TH.mat', 'thr2');
save('thr3-TH.mat', 'thr3');
save('delay-TH.mat', 'delay');
save('delay2-TH.mat', 'delay2');
save('delay3-TH.mat', 'delay3');
save('pl-TH.mat', 'pl');
save('pl2-TH.mat', 'pl2');
save('pl3-TH.mat', 'pl3');

%plots and image savings
fig = figure;
plot(time(:, 1), thr);
hold on;
plot(time(:, 1), thr2, 'r');
plot(time(:, 1), thr3, 'g');
title('Mean throughput vs aggressiveness');
ylabel('Throughput - Mbps'); 
xlabel('Time - s'); 
grid on;
legend({'Standard', 'Aggressive', 'Weak'}, 'Location', "South", 'NumColumns', 2);
saveas(fig, "Compare throughput vs aggressiveness on threshold.jpg");

fig2 = figure;
plot(time(:, 1), delay);
hold on;
plot(time(:, 1), delay2, 'r');
plot(time(:, 1), delay3, 'g');
title('Mean delay vs aggressiveness');
ylabel('Delay - us'); 
xlabel('Time - s'); 
grid on;
legend({'Standard', 'Aggressive', 'Weak'}, 'Location', "South", 'NumColumns', 2);
saveas(fig2, "Compare delay vs aggressiveness on threshold.jpg");

fig3 = figure;
plot(time(:, 1), pl);
hold on;
plot(time(:, 1), pl2, 'r');
plot(time(:, 1), pl3, 'g');
title('Mean packet loss vs aggressiveness');
ylabel('Packet loss - rate'); 
xlabel('Time - s'); 
grid on;
legend({'Standard', 'Aggressive', 'Weak'}, 'Location', "NorthEast", 'NumColumns', 2);
saveas(fig3, "Compare packet loss vs aggressiveness on threshold.jpg");

%% PLOT DEFINITIVO

save('thr-DEF.mat', 'thr');
save('thr2-DEF.mat', 'thr2');
save('thr3-DEF.mat', 'thr3');
save('thr4-DEF.mat', 'thr4');
save('thr5-DEF.mat', 'thr5');
save('thr6-DEF.mat', 'thr6');
save('thr7-DEF.mat', 'thr7');
save('thr8-DEF.mat', 'thr8');
save('thr9-DEF.mat', 'thr9');
save('thr10-DEF.mat', 'thr10');
save('thr11-DEF.mat', 'thr11');
save('thr12-DEF.mat', 'thr12');
save('thr13-DEF.mat', 'thr13');
save('thr14-DEF.mat', 'thr14');
save('thr15-DEF.mat', 'thr15');
save('thr16-DEF.mat', 'thr16');
save('delay-DEF.mat', 'delay');
save('delay2-DEF.mat', 'delay2');
save('delay3-DEF.mat', 'delay3');
save('delay4-DEF.mat', 'delay4');
save('delay5-DEF.mat', 'delay5');
save('delay6-DEF.mat', 'delay6');
save('delay7-DEF.mat', 'delay7');
save('delay8-DEF.mat', 'delay8');
save('delay9-DEF.mat', 'delay9');
save('delay10-DEF.mat', 'delay10');
save('delay11-DEF.mat', 'delay11');
save('delay12-DEF.mat', 'delay12');
save('delay13-DEF.mat', 'delay13');
save('delay14-DEF.mat', 'delay14');
save('delay15-DEF.mat', 'delay15');
save('delay16-DEF.mat', 'delay16');
save('pl-DEF.mat', 'pl');
save('pl2-DEF.mat', 'pl2');
save('pl3-DEF.mat', 'pl3');
save('pl4-DEF.mat', 'pl4');
save('pl5-DEF.mat', 'pl5');
save('pl6-DEF.mat', 'pl6');
save('pl7-DEF.mat', 'pl7');
save('pl8-DEF.mat', 'pl8');
save('pl9-DEF.mat', 'pl9');
save('pl10-DEF.mat', 'pl10');
save('p11l-DEF.mat', 'pl11');
save('pl12-DEF.mat', 'pl12');
save('pl13-DEF.mat', 'pl13');
save('pl14-DEF.mat', 'pl14');
save('pl15-DEF.mat', 'pl15');
save('pl16-DEF.mat', 'pl16');



