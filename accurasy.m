YPred = classify(convnet,imdsvalid);
YValidation = imdsvalid.Labels;
accuracy = sum(YPred == YValidation)/numel(YValidation)

plotconfusion(YValidation,YPred)