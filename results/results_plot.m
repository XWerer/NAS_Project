clearvars;
clc; 

m = readtable('rt50sec50veh.csv');
time = table2array(unique(m(:,1)));
thr = zeros(size(time, 1), 1);
thr_var = zeros(size(time, 1), 1);
thr_s = zeros(1, 1);

delay = zeros(size(time, 1), 1);
delay_s = zeros(1, 1);
first = true;

for i=1:size(time, 1)
    first = true;
    for j=1:size(m, 1)
        if time(i, :) == m{j, 1}
            if first
                thr_s(1) = m{j, 3};
                delay_s(1) = m{j, 6};
                first = false;
            else
                delay_s = [delay_s m{j, 6}];
                thr_s = [thr_s m{j, 3}];
            end
        end
    end
    thr(i, 1) = mean(thr_s);
    thr_var(i, 1) = var(thr_s);
    delay(i, 1) = mean(delay_s);
    
    thr_s = zeros(1, 1);
    delay_s = zeros(1, 1);
end



figure;
errorbar(time(:, 1), thr, thr_var);
figure;
plot(time(:, 1), delay, 'r');
