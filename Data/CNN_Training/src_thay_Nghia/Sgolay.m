%% Load data
clear ; clc; close all;
load('Dx.mat');
Dx=Dx';
%for i = 1:20
i = 1;
    Dx_Sgolay(:,i) = sgolayfilt(Dx(:,i),5,7);
    figure
    plot(Dx(:,i)); hold on;
    plot(Dx_Sgolay(:,i));
%end
Dx_Sgolay = Dx_Sgolay';