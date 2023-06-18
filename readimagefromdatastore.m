%input
a = imread('an4.jpg');


faceDetector = vision.CascadeObjectDetector;
    bbox = step(faceDetector,a);
figure,imshow(a)

if ~isempty(bbox)
    bbox=bbox(1,:);
    rectangle('Position',bbox,'EdgeColor','b','LineWidth',3);
end

%box = imresize(a,[48 48]);
class=classify(convnet,a);
%imshow(box)
%imshow(a)
title(string(class))
