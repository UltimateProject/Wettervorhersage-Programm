clear all
clc 

% hintergrund = importdata('Wetter.jpg');


h=figure('Units','normalized','Position',[0.3 0.2 0.4 0.6],......
        'name','Wetterdaten Oldenburg', 'numbertitle','off');


% create an axes that spans the whole gui
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% import the background image and show it on the axes
bg = imread('Wetter.jpg'); imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');


h1=uicontrol('parent', h, 'Units', 'normalized', 'Position', [0.2 0.7 0.6 0.2],.....
   'BackgroundColor', [1 1 1], 'Style', 'pushbutton', 'FontUnits', 'normalized',....
   'Fontsize', 0.65, 'string', 'Wetter','Callback', 'karte');

h2=uicontrol('parent', h, 'Units', 'normalized', 'Position', [0.2 0.4 0.6 0.2],.....
   'BackgroundColor', [1 1 1], 'Style', 'pushbutton', 'FontUnits', 'normalized',....
   'Fontsize', 0.65, 'string', 'Anleitung');

h3=uicontrol('parent', h, 'Units', 'normalized', 'Position', [0.2 0.1 0.6 0.2],.....
   'BackgroundColor', [1 1 1], 'Style', 'pushbutton', 'FontUnits', 'normalized',....
   'Fontsize', 0.65, 'string', 'Beenden', 'Callback','close(h)');
