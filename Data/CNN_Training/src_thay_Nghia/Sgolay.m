%% Load data
clear ; clc;
load('Dx.mat');
Dx=Dx';
for i = 1:98
    Dx_Sgolay(:,i) = sgolayfilt(Dx(:,i),1,11);
end
Dx_Sgolay = Dx_Sgolay';