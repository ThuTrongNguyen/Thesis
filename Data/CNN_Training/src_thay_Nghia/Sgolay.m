%% Load data
clear ; clc; close all;
load('Dx.mat');
Dx=Dx';
for i = 1:98
    Dx_Sgolay(:,i) = sgolayfilt(Dx(:,i),5,11);
    figure
    plot(Dx(:,i)); hold on;
    plot(Dx_Sgolay(:,i));
end
Dx_Sgolay = Dx_Sgolay';