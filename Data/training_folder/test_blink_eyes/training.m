close all; clc;
x = xlsread('E:\TRONGTHU\KDT2108b\_do_an\training_folder\test_blink_eyes\bink_eyes.xlsx');
tx = xlsread('E:\TRONGTHU\KDT2108b\_do_an\training_folder\test_blink_eyes\target.xlsx');
% y = xlsread('E:\TRONGTHU\KDT2108b\_do_an\training_folder\input_after_sgolay_filt_for_test.xlsx');
% ty = xlsread('E:\TRONGTHU\KDT2108b\_do_an\training_folder\target_for_test.xlsx');

trainFcn = 'trainscg';
%hiddenLayerSize = 50;
net = patternnet([20 20]);
%net = feedforwardnet([1 1]);
net.divideParam.trainRatio = 75/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
% Train the Network
[net,tr] = train(net,x,tx);
% Test the Network
y = net(x);

performance = perform(net,tx,y);
tind = vec2ind(tx);
yind = vec2ind(y);
percentErrors = sum(tind ~= yind)/numel(tind);
% View the Network
view(net);
figure; plotconfusion(tx,y);
% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
