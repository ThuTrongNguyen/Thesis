clear; clc;
layers = [imageInputLayer([1 7400])
          convolution2dLayer([1 102],3,'stride',1)       
          maxPooling2dLayer([1 2],'stride',2)
          convolution2dLayer([1 24],10,'numChannels',3)
          maxPooling2dLayer([1 2],'stride',2)
          convolution2dLayer([1 11],10,'stride',1,'numChannels',10)
          maxPooling2dLayer([1 2],'stride',2)
          convolution2dLayer([1 9],10,'numChannels',10)
          maxPooling2dLayer([1 2],'stride',2)
          fullyConnectedLayer(30)                 
          fullyConnectedLayer(10)
          fullyConnectedLayer(2)
          softmaxLayer
          classificationLayer];
opts = trainingOptions('sgdm');
% load 'E:\New Folder\data.mat';
% load 'E:\New Folder\labels.mat';
load 'E:\TRONGTHU\KDT2108b\_do_an\GitRepo\Data\CNN_Training\Dx.mat';
load 'E:\TRONGTHU\KDT2108b\_do_an\GitRepo\Data\CNN_Training\Dy.mat';
load 'E:\TRONGTHU\KDT2108b\_do_an\GitRepo\Data\CNN_Training\DxLabel.mat';
load 'E:\TRONGTHU\KDT2108b\_do_an\GitRepo\Data\CNN_Training\DyLabel.mat';
labels = categorical(DxLabel);
convnet = trainNetwork(Dx,labels,layers,opts);