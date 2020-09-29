%% Load data
clear ; clc;
load('Dx_Sgolay_3_7.mat');
load('Dy_Sgolay_3_7.mat');
load('DxLabel.mat');
load('DyLabel.mat');

Dx=Dx_Sgolay';
Dy=Dy_Sgolay';
Dx=reshape(Dx, [size(Dx,1),1,1,size(Dx,2)]);
Dy=reshape(Dy, [size(Dy,1),1,1,size(Dy,2)]);

% label_Tr(1:56,1) = {'T'};
% label_Tr(57:98,1) = {'P'};
% label_Te(1:24,1) = {'T'};
% label_Te(25:42,1) = {'P'};
DxLabel=categorical(DxLabel);
DyLabel=categorical(DyLabel);
%% Create Neural and Train
% convnet = [imageInputLayer([7400 1])
%           convolution2dLayer([102 1],3,'stride',1)       
%           maxPooling2dLayer([2 1],'stride',2)
%           convolution2dLayer([24 1],10,'numChannels',3)
%           maxPooling2dLayer([2 1],'stride',2)
%           convolution2dLayer([11 1],10,'stride',1,'numChannels',10)
%           maxPooling2dLayer([2 1],'stride',2)
%           convolution2dLayer([9 1],10,'numChannels',10)
%           maxPooling2dLayer([2 1],'stride',2)
%           fullyConnectedLayer(30)                 
%           fullyConnectedLayer(10)
%           fullyConnectedLayer(2)
%           softmaxLayer
%           classificationLayer];

      convnet = [imageInputLayer([7400 1])
          convolution2dLayer([60 1],4,'stride',1)       
          maxPooling2dLayer([2 1],'stride',2)
          convolution2dLayer([50 1],4,'stride',1)
          maxPooling2dLayer([2 1],'stride',2)
          convolution2dLayer([40 1],10,'stride',1)
          maxPooling2dLayer([2 1],'stride',2)
          convolution2dLayer([40 1],10,'stride',1)
          maxPooling2dLayer([2 1],'stride',2)
          convolution2dLayer([4 1],15,'stride',1)
          maxPooling2dLayer([2 1],'stride',2)
          fullyConnectedLayer(50)                 
          fullyConnectedLayer(20)
          fullyConnectedLayer(2)
          softmaxLayer
          classificationLayer];



opts = trainingOptions('sgdm','MaxEpochs',100, ...
	'InitialLearnRate',0.0001,'Plots', 'training-progress');
net = trainNetwork(Dx,DxLabel,convnet,opts);
% Test the Network
YTest = classify(net, Dy);
accuracy = sum(YTest == DyLabel)/numel(DyLabel)*100


