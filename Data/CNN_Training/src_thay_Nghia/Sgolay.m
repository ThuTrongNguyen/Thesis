%% Load data
clear ; clc; close all;
load('Dx.mat');
Dx=Dx';
for i = 1:20
    Dx_Sgolay(:,i) = sgolayfilt(Dx(:,i),97,99);
    figure
    plot(Dx(:,i)); hold on;
    plot(Dx_Sgolay(:,i));
end
Dx_Sgolay = Dx_Sgolay';