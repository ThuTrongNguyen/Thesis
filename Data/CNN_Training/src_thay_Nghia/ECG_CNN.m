%% Load data
clear ; clc;
% load 'E:\TRONGTHU\KDT2108b\_do_an\GitRepo\Data\Dx.mat';
% load 'E:\TRONGTHU\KDT2108b\_do_an\GitRepo\Data\Dy.mat';

load('Dx.mat');
load('Dy.mat');


Dx=Dx';
Dx=reshape(Dx, [size(Dx,1),1,1,size(Dx,2)]);
Dy=reshape(Dy, [size(Dy,1),1,1,size(Dy,2)]);

label_Tr(1:56,1) = {'T'};
label_Tr(57:98,1) = {'P'};
label_Te(1:24,1) = {'T'};
label_Te(25:42,1) = {'P'};
label_Tr=categorical(label_Tr);
label_Te=categorical(label_Te);
%% Create Neural and Train

%      convnet = [imageInputLayer([7400 1], 'Normalization', 'none')
%           convolution2dLayer([20 1],32)
%           maxPooling2dLayer([2,1],'Stride',1);
%           convolution2dLayer([2 1],64)
%           reluLayer
%           maxPooling2dLayer([2,1],'Stride',1);
%           convolution2dLayer([3 1],128)
%           reluLayer
%           maxPooling2dLayer([2,1]);
%           dropoutLayer();
%           fullyConnectedLayer(40);
%           fullyConnectedLayer(20);
%           fullyConnectedLayer(2);
%           softmaxLayer
%           classificationLayer()];
      
convnet = [imageInputLayer([7400 1])
          convolution2dLayer([102 1],3,'stride',1)       
          maxPooling2dLayer([2 1],'stride',2)
          convolution2dLayer([24 1],10,'numChannels',3)
          maxPooling2dLayer([2 1],'stride',2)
          convolution2dLayer([11 1],10,'stride',1,'numChannels',10)
          maxPooling2dLayer([2 1],'stride',2)
          convolution2dLayer([9 1],10,'numChannels',10)
          maxPooling2dLayer([2 1],'stride',2)
          fullyConnectedLayer(30)                 
          fullyConnectedLayer(10)
          fullyConnectedLayer(2)
          softmaxLayer
          classificationLayer];


opts = trainingOptions('sgdm');
net = trainNetwork(Dx,label_Tr,convnet,opts);
% Test the Network
YPred = classify(net, Dx);
accuracy = sum(YPred' == label_Tr)/numel(label_Tr)*100


