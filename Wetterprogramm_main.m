close all  % Schlie�t alle noch ge�ffneten Skripte und Funktionen.
clear all  % Leert den Workspace.
clc        % Leert die Commandline.

% Erstellt eine Figure die als Fenster f�r das Hauptmen� dient. ES werden
% diverse Parameter wie z.B. Startposition, Gr��e, �berschrift etc.
% festgelegt.
h=figure('Units','normalized','Position',[0.3 0.2 0.4 0.6],......
        'name','Wetterdaten Oldenburg', 'numbertitle','off');


% Erstellt Gr��e �ber das gesamte Fenster.
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% Importiert das Hintergrundbild und zeigt es in der eingestellten Gr��e an.
bg = imread('Wetter.jpg'); imagesc(bg);
% Verhindert das der Hintergrund �bergeplottet wird und entfernt parallel die Achsen. 
set(ah,'handlevisibility','off','visible','off')
% Garantiert dass das Hintergundbild hinter allem anderen liegt.
uistack(ah, 'bottom');

% Erstellt den ersten Button mit diversen Eigenschaften wie z.B. Gr��e,
% Position, Callback, Beschriftung, etc. 
h1=uicontrol('parent', h, 'Units', 'normalized', 'Position', [0.2 0.55 0.6 0.2],.....
   'BackgroundColor', [1 1 1], 'Style', 'pushbutton', 'FontUnits', 'normalized',....
   'Fontsize', 0.65, 'string', 'Wetter','Callback', 'Karte_Verarbeitungen');

% Erstellt den dritten Button mit diversen Eigenschaften wie z.B. Gr��e,
% Position, Callback, Beschriftung, etc. 
h3=uicontrol('parent', h, 'Units', 'normalized', 'Position', [0.2 0.25 0.6 0.2],.....
   'BackgroundColor', [1 1 1], 'Style', 'pushbutton', 'FontUnits', 'normalized',....
   'Fontsize', 0.65, 'string', 'Beenden', 'Callback','close(h)');


%--------------------Licence ---------------------------------------------
% Copyright (c) <2014> Marc Hieronimus, Joseffa Baumann



