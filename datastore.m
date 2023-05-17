imds = imageDatastore('gesture', ...
        'IncludeSubfolders',true,'LabelSource','foldernames')

[imdstrain, imdsvalid]=splitEachLabel(imds,.8,'randomize');
  
     
CountLabel = imds.countEachLabel

aa=read(imds);
size(aa)

layers = [
    imageInputLayer([48 48 1])
    
    convolution2dLayer(3,8,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    fullyConnectedLayer(7)
    softmaxLayer
    classificationLayer];

options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',10, ...
    'Shuffle','every-epoch', ...
    'ValidationFrequency',10, ...
    'Verbose',false, ...
    'Plots','training-progress');

convnet = trainNetwork(imdstrain,layers,options);