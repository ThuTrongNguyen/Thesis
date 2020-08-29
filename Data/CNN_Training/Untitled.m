clear all; clc;
inputLayer=imageInputLayer([1 4000]);
c1=convolution2dLayer([1 200],20,'stride',1);
p1=maxPooling2dLayer([1 20],'stride',10);
c2=convolution2dLayer([1 30],400,'numChannels',20);
p2=maxPooling2dLayer([1 10],'stride',[1 2]);
f1=fullyConnectedLayer(500);
f2=fullyConnectedLayer(500);
s1=softmaxLayer;
outputLayer=classificationLayer;
convnet=[inputLayer; c1; p1; c2; p2; f1; f2; s1;outputLayer]
opts = trainingOptions('sgdm');
load 'E:\New Folder\data.mat';
load 'E:\New Folder\labels.mat';
labels = categorical(label);
convnet = trainNetwork(x',labels,convnet,opts); % Huan luyen mang
% convnet = trainNetwork(allData',labels,convnet,opts); % Huan luyen mang
% Co allData, label