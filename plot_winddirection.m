function [] = plot_winddirection( grad_richtung )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

q = grad_richtung * pi/180; % Rechnet die Gradzahl in rad um.

[w,e]=pol2cart(q,1); % Wandelt die polaren Koordinaten in kartesische um.

G=compass(w,e); % Erstellt einen Kompass mit der entsprechenden Windrichtung.

% �ndert die Gradzahlen um den Kompass in die Abk�rzungen der Himmelsrichtungen. 
set(findall(gcf, 'String', '0'),'String', 'E');     % �ndert 0 Grad in E
set(findall(gcf, 'String', '30'),'String', 'ENE');  % �ndert 30 Grad in ENE
set(findall(gcf, 'String', '60'),'String', 'NNE');  % �ndert 60 Grad in NNE
set(findall(gcf, 'String', '90'),'String', 'N');    % �ndert 90 Grad in E
set(findall(gcf, 'String', '120'),'String', 'NNW'); % �ndert 120 Grad in NNW
set(findall(gcf, 'String', '150'),'String', 'WNW'); % �ndert 150 Grad in WNW
set(findall(gcf, 'String', '180'),'String', 'W');   % �ndert 180 Grad in W
set(findall(gcf, 'String', '210'),'String', 'WSW'); % �ndert 210 Grad in WSW
set(findall(gcf, 'String', '240'),'String', 'SSW'); % �ndert 240 Grad in SSW
set(findall(gcf, 'String', '270'),'String', 'S');   % �ndert 270 Grad in S
set(findall(gcf, 'String', '300'),'String', 'SSE'); % �ndert 300 Grad in SSE
set(findall(gcf, 'String', '330'),'String', 'ESE'); % �ndert 330 Grad in ESE
set(G,'Color','r', 'LineWidth', 3)  % �ndert Pfeilfarbe in rot und erh�ht
                                    % die Strichdicke auf 3.
                                   
end % Ende der Funktion

%--------------------Licence ---------------------------------------------
% Copyright (c) <2014> Marc Hieronimus, Joseffa Baumann