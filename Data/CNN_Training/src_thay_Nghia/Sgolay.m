%% Load data
clear ; clc;
load('Dy.mat');
Dy=Dy';
for i = 1:42
    Dy_Sgolay(:,i) = sgolayfilt(Dy(:,i),1,101);
end