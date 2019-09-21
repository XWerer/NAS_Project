%% setup
clearvars;
clc; 

filename = "50-50-nop";
filename2 = "50-50-pr";
filename3 = "50-50-sir";
filename4 = "50-50-nor";

%reading csv file and taking the time intervals involved
m = readtable(filename + '.csv');
m2 = readtable(filename2 + '.csv');
m3 = readtable(filename3 + '.csv');
m4 = readtable(filename4 + '.csv');

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

%arrays for mean delay calculation
delay = zeros(size(time, 1), 1);
delay_s = zeros(1, 1);
delay2 = zeros(size(time, 1), 1);
delay_s2 = zeros(1, 1);
delay3 = zeros(size(time, 1), 1);
delay_s3 = zeros(1, 1);
delay4 = zeros(size(time, 1), 1);
delay_s4 = zeros(1, 1);

%arrays for mean packet loss calculation
pl = zeros(size(time, 1), 1);
pl_s = zeros(1, 1);
pl2 = zeros(size(time, 1), 1);
pl_s2 = zeros(1, 1);
pl3 = zeros(size(time, 1), 1);
pl_s3 = zeros(1, 1);
pl4 = zeros(size(time, 1), 1);
pl_s4 = zeros(1, 1);

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

%% PLOTS

%plots and image savings
totalfig = figure;
%fig = figure;
subplot(3, 1, 1);
plot(time(:, 1), thr);
hold on;
plot(time(:, 1), thr2, 'r');
plot(time(:, 1), thr3, 'g');
plot(time(:, 1), thr4, 'k');
title('Comparison throughput');
ylabel('Throughput - Mbps'); 
xlabel('Time - s'); 
grid on;
%legend({'Baseline', 'Project', 'Only rerouting', 'Only interval change'}, 'Location', "South", 'NumColumns', 2);
%saveas(fig, "Compare throughput per time " + filename + " " + filename2 + " " + filename3 + " " + filename4 + ".jpg");

%fig2 = figure;
subplot(3, 1, 2);
plot(time(:, 1), delay);
hold on;
plot(time(:, 1), delay2, 'r');
plot(time(:, 1), delay3, 'g');
plot(time(:, 1), delay4, 'k');
title('Comparison delay');
ylabel('Delay - us'); 
xlabel('Time - s'); 
grid on;
legend({'Baseline', 'Project', 'Only rerouting', 'Only interval change'}, 'Location', "NorthEast", 'NumColumns', 2);
%saveas(fig2, "Compare delay per time " + filename + " " + filename2 + " " + filename3 + " " + filename4 + ".jpg");

%fig3 = figure;
subplot(3, 1, 3);
plot(time(:, 1), pl);
hold on;
plot(time(:, 1), pl2, 'r');
plot(time(:, 1), pl3, 'g');
plot(time(:, 1), pl4, 'k');
title('Comparison packet loss');
ylabel('Packet loss - rate'); 
xlabel('Time - s'); 
grid on;
%legend({'Baseline', 'Project', 'Only rerouting', 'Only interval change'}, 'Location', "South", 'NumColumns', 2);
%saveas(fig3, "Compare packet loss per time " + filename + " " + filename2 + " " + filename3 + " " + filename4 + ".jpg");
saveas(totalfig, "Compare packet loss per time " + filename + " " + filename2 + " " + filename3 + " " + filename4 + " TOTAL.jpg");
