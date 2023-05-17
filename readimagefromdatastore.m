a=read(imdsvalid  );
class=classify(convnet,a)

imshow(a)
title(string(class))