clc;
clear;
close all;

% Prepare
vid = videoinput('winvideo',1);
set(vid, 'FramesPerTrigger', 300);
start(vid);
fig = figure;

% Run until figure is closed
while(ishandle(fig))
  % Wait for frame time
  pause(0.01);
  avail = get(vid,'FramesAvailable');
  if(avail > 0)
    % Get frame
    [frame, time] = getdata(vid, avail);
    img = frame(:,:,:,1);
    figure(fig);
    subplot(2,1,1);
    imshow(img);
    
    % Calculate equalized image
    imgEq = imageHistogramEq(img);
    figure(fig);
    subplot(2,1,2);
    imshow(imgEq);
  end
end

delete(vid);
clear vid;
