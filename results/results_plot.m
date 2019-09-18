clearvars;
clc; 

m = readtable('dt2.csv');
time = table2array(unique(m(:,1)));
n_v = size(m, 1)/19; %size(time, 1)
tensor = zeros(n_v, size(m,2) - 1, size(time, 1));

for i = 1:size(time)
   tensor(:, :, i) = table2array(m(((i-1)*n_v+1):n_v*i, 2:size(m, 2)));
end
disp(tensor)

thr = mean(tensor(:, 2, :));
vars_thr = var(tensor(:, 2, :));

errorbar(time(:, 1), squeeze(thr), squeeze(vars_thr));

