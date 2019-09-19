%% setup
clearvars;
clc; 

filename = "rt50sec100veh";

%reading csv file and taking the time intervals involved
m = readtable(filename + '.csv');
time = table2array(unique(m(:,1)));

%% calculation on all vehicles
%arrays for thr calculation - mean and variance
thr = zeros(size(time, 1), 1);
thr_var = zeros(size(time, 1), 1);
thr_s = zeros(1, 1);
%arrays for mean delay calculation
delay = zeros(size(time, 1), 1);
delay_s = zeros(1, 1);
%arrays for mean packet loss calculation
pl = zeros(size(time, 1), 1);
pl_s = zeros(1, 1);

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
    thr_var(i, 1) = var(thr_s);
    delay(i, 1) = mean(delay_s);
    pl(i, 1) = mean(pl_s);
    
    %zeroing temporary arrays for further analysis
    thr_s = zeros(1, 1);
    delay_s = zeros(1, 1);
    pl_s = zeros(1, 1);
end

%plots and image savings
fig = figure;
title('Throughput vs time (variance of thr displayed)');
errorbar(time(:, 1), thr, thr_var);
ylabel('Throughput (with variance) - Mbps'); 
xlabel('Time - s'); 
grid on;
saveas(fig, "Mean throughput per time " + filename + ".jpg");

fig2 = figure;
title('Delay vs time');
plot(time(:, 1), delay, 'r');
ylabel('Delay - us'); 
xlabel('Time - s'); 
grid on;
saveas(fig2, "Mean delay per time " + filename + ".jpg");

fig3 = figure;
title('Packet loss vs time');
plot(time(:, 1), pl, 'g');
ylabel('Packet loss - rate'); 
xlabel('Time - s'); 
grid on;
saveas(fig3, "Mean packet loss per time " + filename + ".jpg");

%% calculation per vehicle
veh_id = 45;
thr_veh = zeros(size(time, 1), 1);
rerout = zeros(size(time, 1), 1);

for i=1:size(time, 1)
    for j=1:size(m, 1)
        if m{j, 1} == time(i, 1)
            if m{j, 2} == veh_id
                thr_veh(i) = m{j, 3};
                rerout(i) = m{j, 16};
            end
        end
    end
end
    
fig4 = figure;
title("Throughput for vehicle " + veh_id + " vs time");
plot(time(:, 1), thr_veh);
ylabel("Throughput vehicle " + veh_id + " - Mbps"); 
xlabel('Time - s'); 
grid on;
hold on;
bar(time(:, 1), rerout, 'FaceColor', 'r', 'LineWidth', 0.4);
legend('Throughput', 'Rerouting');
saveas(fig4, "Throughput vehicle " + veh_id + " per time " + filename + ".jpg");

