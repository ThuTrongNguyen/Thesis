%% Load data
clear ; clc; close all;
load('Dy.mat');
Dy=Dy';
for i = 1:42
    Dy_Sgolay(:,i) = sgolayfilt(Dy(:,i),4,11);
    figure
    plot(Dy(:,i)); hold on;
    plot(Dy_Sgolay(:,i));
end
Dy_Sgolay = Dy_Sgolay';