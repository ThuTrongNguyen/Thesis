close all; clc;
x = xlsread('E:\TRONGTHU\KDT2108b\_do_an\training_folder\input_after_sgolay_filt.xlsx');
tx = xlsread('E:\TRONGTHU\KDT2108b\_do_an\training_folder\target.xlsx');
y = xlsread('E:\TRONGTHU\KDT2108b\_do_an\training_folder\input_after_sgolay_filt_for_test.xlsx');
ty = xlsread('E:\TRONGTHU\KDT2108b\_do_an\training_folder\target_for_test.xlsx');

trainFcn = 'trainscg';
%hiddenLayerSize = 50;
net = patternnet([2 9]);
%net = feedforwardnet([1 1]);
% net.divideParam.trainRatio = 75/100;
% net.divideParam.valRatio = 15/100;
% net.divideParam.testRatio = 15/100;
% Train the Network
[net,tr] = train(net,x,tx);
% Test the Network
ytest = net(y);
view(net);
perf = perform(net,ty,ytest);
classes = vec2ind(ytest);
% 
figure; plotconfusion(ty,ytest);
% %figure; plotperform(tr);
% %figure; plottrainstate(tr);
% %figure; plotregression(t,y);
