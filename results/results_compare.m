%% setup
clearvars;
clc; 

filename = "100veh-standard-standard-standard";
filename2 = "100veh-hard_1_5-soft_1_2-time_1_5";
filename3 = "100veh-hard_2_3-soft_1_8-time_2_3";
%filename4 = "100veh-false-false";
%filename5 = "100veh-window_8";
% filename6 = "175veh-all_standard";
% filename7 = "200veh-all_standard";

%reading csv file and taking the time intervals involved
m = readtable(filename + '.csv');
m2 = readtable(filename2 + '.csv');
m3 = readtable(filename3 + '.csv');
%m4 = readtable(filename4 + '.csv');
%m5 = readtable(filename5 + '.csv');
% m6 = readtable(filename6 + '.csv');
% m7 = readtable(filename7 + '.csv');

time = table2array(unique(m(:,1)));

%% calculation on all vehicles
%arrays for thr calculation - mean and variance
thr = zeros(size(time, 1), 1);
thr_s = zeros(1, 1);
thr2 = zeros(size(time, 1), 1);
thr_s2 = zeros(1, 1);
thr3 = zeros(size(time, 1), 1);
thr_s3 = zeros(1, 1);
% thr4 = zeros(size(time, 1), 1);
% thr_s4 = zeros(1, 1);
% thr5 = zeros(size(time, 1), 1);
% thr_s5 = zeros(1, 1);
% thr6 = zeros(size(time, 1), 1);
% thr_s6 = zeros(1, 1);
% thr7 = zeros(size(time, 1), 1);
% thr_s7 = zeros(1, 1);

%arrays for mean delay calculation
delay = zeros(size(time, 1), 1);
delay_s = zeros(1, 1);
delay2 = zeros(size(time, 1), 1);
delay_s2 = zeros(1, 1);
delay3 = zeros(size(time, 1), 1);
delay_s3 = zeros(1, 1);
% delay4 = zeros(size(time, 1), 1);
% delay_s4 = zeros(1, 1);
% delay5 = zeros(size(time, 1), 1);
% delay_s5 = zeros(1, 1);
% delay6 = zeros(size(time, 1), 1);
% delay_s6 = zeros(1, 1);
% delay7 = zeros(size(time, 1), 1);
% delay_s7 = zeros(1, 1);

%arrays for mean packet loss calculation
pl = zeros(size(time, 1), 1);
pl_s = zeros(1, 1);
pl2 = zeros(size(time, 1), 1);
pl_s2 = zeros(1, 1);
pl3 = zeros(size(time, 1), 1);
pl_s3 = zeros(1, 1);
% pl4 = zeros(size(time, 1), 1);
% pl_s4 = zeros(1, 1);
% pl5 = zeros(size(time, 1), 1);
% pl_s5 = zeros(1, 1);
% pl6 = zeros(size(time, 1), 1);
% pl_s6 = zeros(1, 1);
% pl7 = zeros(size(time, 1), 1);
% pl_s7 = zeros(1, 1);

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

% first = true;   
% for i=1:size(time, 1)
%     first = true;
%     for j=1:size(m4, 1)
%         if time(i, :) == m4{j, 1}
%             if first
%                 %saving stats
%                 thr_s4(1) = m4{j, 3};             %thr
%                 delay_s4(1) = m4{j, 6};           %delay
%                 if m4{j, 13} ~= -1           
%                     pl_s4 = m4{j, 13};            %if there are packets, packet loss
%                 end
%                 first = false;
%             else
%                 delay_s4 = [delay_s4 m4{j, 6}];    %same here
%                 thr_s4 = [thr_s4 m4{j, 3}];
%                 if m4{j, 13} ~= -1
%                     pl_s4 = [pl_s4 m4{j, 13}];
%                 end
%             end
%         end
%     end
%     %calculating stats per time instant
%     thr4(i, 1) = mean(thr_s4);
%     delay4(i, 1) = mean(delay_s4);
%     pl4(i, 1) = mean(pl_s4);
%     
%     %zeroing temporary arrays for further analysis
%     thr_s4 = zeros(1, 1);
%     delay_s4 = zeros(1, 1);
%     pl_s4 = zeros(1, 1);
% end
% 
% disp("Fourth done");

% first = true;   
% for i=1:size(time, 1)
%     first = true;
%     for j=1:size(m5, 1)
%         if time(i, :) == m5{j, 1}
%             if first
%                 %saving stats
%                 thr_s5(1) = m5{j, 3};             %thr
%                 delay_s5(1) = m5{j, 6};           %delay
%                 if m5{j, 13} ~= -1           
%                     pl_s5 = m5{j, 13};            %if there are packets, packet loss
%                 end
%                 first = false;
%             else
%                 delay_s5 = [delay_s5 m5{j, 6}];    %same here
%                 thr_s5 = [thr_s5 m5{j, 3}];
%                 if m5{j, 13} ~= -1
%                     pl_s5 = [pl_s5 m5{j, 13}];
%                 end
%             end
%         end
%     end
%     %calculating stats per time instant
%     thr5(i, 1) = mean(thr_s5);
%     delay5(i, 1) = mean(delay_s5);
%     pl5(i, 1) = mean(pl_s5);
%     
%     %zeroing temporary arrays for further analysis
%     thr_s5 = zeros(1, 1);
%     delay_s5 = zeros(1, 1);
%     pl_s5 = zeros(1, 1);
% end
% 
% disp("Fifth done");

% first = true;   
% for i=1:size(time, 1)
%     first = true;
%     for j=1:size(m6, 1)
%         if time(i, :) == m6{j, 1}
%             if first
%                 %saving stats
%                 thr_s6(1) = m6{j, 3};             %thr
%                 delay_s6(1) = m6{j, 6};           %delay
%                 if m6{j, 13} ~= -1           
%                     pl_s6 = m6{j, 13};            %if there are packets, packet loss
%                 end
%                 first = false;
%             else
%                 delay_s6 = [delay_s6 m6{j, 6}];    %same here
%                 thr_s6 = [thr_s6 m6{j, 3}];
%                 if m6{j, 13} ~= -1
%                     pl_s6 = [pl_s6 m6{j, 13}];
%                 end
%             end
%         end
%     end
%     %calculating stats per time instant
%     thr6(i, 1) = mean(thr_s6);
%     delay6(i, 1) = mean(delay_s6);
%     pl6(i, 1) = mean(pl_s6);
%     
%     %zeroing temporary arrays for further analysis
%     thr_s6 = zeros(1, 1);
%     delay_s6 = zeros(1, 1);
%     pl_s6 = zeros(1, 1);
% end
% 
% disp("Sixth done");
% 
% first = true;   
% for i=1:size(time, 1)
%     first = true;
%     for j=1:size(m7, 1)
%         if time(i, :) == m7{j, 1}
%             if first
%                 %saving stats
%                 thr_s7(1) = m7{j, 3};             %thr
%                 delay_s7(1) = m7{j, 6};           %delay
%                 if m7{j, 13} ~= -1           
%                     pl_s7 = m7{j, 13};            %if there are packets, packet loss
%                 end
%                 first = false;
%             else
%                 delay_s7 = [delay_s7 m7{j, 6}];    %same here
%                 thr_s7 = [thr_s7 m7{j, 3}];
%                 if m7{j, 13} ~= -1
%                     pl_s7 = [pl_s7 m7{j, 13}];
%                 end
%             end
%         end
%     end
%     %calculating stats per time instant
%     thr7(i, 1) = mean(thr_s7);
%     delay7(i, 1) = mean(delay_s7);
%     pl7(i, 1) = mean(pl_s7);
%     
%     %zeroing temporary arrays for further analysis
%     thr_s7 = zeros(1, 1);
%     delay_s7 = zeros(1, 1);
%     pl_s7 = zeros(1, 1);
% end
% 
% disp("Seventh done");

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

% TTFFthr = [mean(thr) mean(thr2) mean(thr3) mean(thr4)];
% TTFFdelay = [mean(delay) mean(delay2) mean(delay3) mean(delay4)];
% TTFFpl = [mean(pl) mean(pl2) mean(pl3) mean(pl4)];
% save('TTFFthr.mat', 'TTFFthr');
% save('TTFFdelay.mat', 'TTFFdelay');
% save('TTFFpl.mat', 'TTFFpl');
load('TTFFthr.mat');
load('TTFFdelay.mat');
load('TTFFpl.mat');

x = ['TT'; 'TF'; 'FT'; 'FF'];

fig = figure;
bar(TTFFthr);
set(gca,'xticklabel', x);
title('Mean throughput vs strategy combination');
ylabel('Throughput - Mbps'); 
xlabel('Combination of strategies'); 
grid minor;
saveas(fig, "Mean throughput vs project.jpg");

fig2 = figure;
bar(TTFFdelay, 'r');
set(gca,'xticklabel', x);
title('Mean delay vs strategy combination');
ylabel('Delay - us'); 
xlabel('Combination of strategies'); 
grid minor;
saveas(fig2, "Mean delay vs project.jpg");

fig3 = figure;
bar(TTFFpl, 'g');
set(gca,'xticklabel', x);
title('Mean packet loss vs strategy combination');
ylabel('Packet loss - Rate'); 
xlabel('Combination of strategies'); 
xTicks = ["TT"; "TF"; "FT"; "FF"];
grid minor;
saveas(fig3, "Mean packet loss vs project.jpg");

%% PLOTS FOR THR AGGRESSIVENESS

% save('thr-TH.mat', 'thr');
% save('thr2-TH.mat', 'thr2');
% save('thr3-TH.mat', 'thr3');
% save('delay-TH.mat', 'delay');
% save('delay2-TH.mat', 'delay2');
% save('delay3-TH.mat', 'delay3');
% save('pl-TH.mat', 'pl');
% save('pl2-TH.mat', 'pl2');
% save('pl3-TH.mat', 'pl3');

load('thr-TH.mat');
load('thr2-TH.mat');
load('thr3-TH.mat');
load('delay-TH.mat');
load('delay2-TH.mat');
load('delay3-TH.mat');
load('pl-TH.mat');
load('pl2-TH.mat');
load('pl3-TH.mat');
load('thr4-TTFF.mat');
load('delay4-TTFF.mat');
load('pl4-TTFF.mat');
%%

thr = thr(11:size(thr, 1));
thr2 = thr2(11:size(thr2, 1));
thr3 = thr3(11:size(thr3, 1));
thr4 = thr4(11:size(thr4, 1));
delay = delay(11:size(delay, 1))/1000;
delay2 = delay2(11:size(delay2, 1))/1000;
delay3 = delay3(11:size(delay3, 1))/1000;
delay4 = delay4(11:size(delay4, 1))/1000;
pl = pl(11:size(pl, 1));
pl2 = pl2(11:size(pl2, 1));
pl3 = pl3(11:size(pl3, 1));
pl4 = pl4(11:size(pl4, 1));
time = time(11:size(time, 1));
%%
%plots and image savings
fig = figure;
plot(time(:, 1), thr);
hold on;
plot(time(:, 1), thr2, 'r');
plot(time(:, 1), thr3, 'g');
plot(time(:, 1), thr4, 'k');
title('Mean throughput vs aggressiveness');
ylabel('Throughput - Mbps'); 
xlabel('Time - s'); 
grid on;
legend({'Standard', 'Aggressive', 'Weak', 'Baseline'}, 'Location', "South", 'NumColumns', 2);
saveas(fig, "Compare throughput vs aggressiveness on threshold.jpg");

fig2 = figure;
plot(time(:, 1), delay);
hold on;
plot(time(:, 1), delay2, 'r');
plot(time(:, 1), delay3, 'g');
plot(time(:, 1), delay4, 'k');
title('Mean delay vs aggressiveness');
ylabel('Delay - ms'); 
xlabel('Time - s'); 
grid on;
legend({'Standard', 'Aggressive', 'Weak', 'Baseline'}, 'Location', "NorthEast", 'NumColumns', 2);
saveas(fig2, "Compare delay vs aggressiveness on threshold.jpg");

fig3 = figure;
plot(time(:, 1), pl);
hold on;
plot(time(:, 1), pl2, 'r');
plot(time(:, 1), pl3, 'g');
plot(time(:, 1), pl4, 'k');
title('Mean packet loss vs aggressiveness');
ylabel('Packet loss - rate'); 
xlabel('Time - s'); 
grid on;
legend({'Standard', 'Aggressive', 'Weak', 'Baseline'}, 'Location', "NorthEast", 'NumColumns', 2);
saveas(fig3, "Compare packet loss vs aggressiveness on threshold.jpg");

