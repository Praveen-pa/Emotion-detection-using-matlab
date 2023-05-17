%camera = webcam(1); % Connect to the camera
%camera = ipcam('http://192.168.225.88:8080/video'); % paste the same url as show in the IP Webcam app.
clear camera
figure
camera = webcam(1) % select your webcam

while true   
    im = camera.snapshot;     
    picture=rgb2gray(im);% Take a picture    
    picture = imresize(picture,[48,48]);  % Resize the picture
    label = classify(convnet, picture);        % Classify the picture
       %thingSpeakWrite(467220,0,'WriteKey','H5TEVABDP00IFYKM')
    image(im);     % Show the picture
    title(char(label)); % Show the label
    drawnow;   
end
