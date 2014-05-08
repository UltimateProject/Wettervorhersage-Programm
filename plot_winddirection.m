function [] = plot_winddirection( grad_richtung, staerke_aktuell )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

q = grad_richtung(1,2) * pi/180; % Rechnet die Gradzahl in rad um.

[w,e]=pol2cart(q,staerke_aktuell(1,1)); % Wandelt die polaren Koordinaten in kartesische um.

axes ('Position', [0.05 0.05 0.1 0.2])

G=compass(w,e); % Erstellt einen Kompass mit der entsprechenden Windrichtung.

% Ändert die Gradzahlen um den Kompass in die Abkürzungen der Himmelsrichtungen. 
set(findall(gcf, 'String', '0'),'String', 'E');     % Ändert 0 Grad in E
set(findall(gcf, 'String', '30'),'String', 'ENE');  % Ändert 30 Grad in ENE
set(findall(gcf, 'String', '60'),'String', 'NNE');  % Ändert 60 Grad in NNE
set(findall(gcf, 'String', '90'),'String', 'N');    % Ändert 90 Grad in E
set(findall(gcf, 'String', '120'),'String', 'NNW'); % Ändert 120 Grad in NNW
set(findall(gcf, 'String', '150'),'String', 'WNW'); % Ändert 150 Grad in WNW
set(findall(gcf, 'String', '180'),'String', 'W');   % Ändert 180 Grad in W
set(findall(gcf, 'String', '210'),'String', 'WSW'); % Ändert 210 Grad in WSW
set(findall(gcf, 'String', '240'),'String', 'SSW'); % Ändert 240 Grad in SSW
set(findall(gcf, 'String', '270'),'String', 'S');   % Ändert 270 Grad in S
set(findall(gcf, 'String', '300'),'String', 'SSE'); % Ändert 300 Grad in SSE
set(findall(gcf, 'String', '330'),'String', 'ESE'); % Ändert 330 Grad in ESE
set(G,'Color','r', 'LineWidth', 3)  % Ändert Pfeilfarbe in rot und erhöht
                                    % die Strichdicke auf 3.
% Variable erstellen für uicontrol, für Textausgabe
wind1=uicontrol('style','text');
% Umformung der Werte in Strings, einfügen von m/s
aktuell1 = grad_richtung(1,1);
aktuell1 = num2str(aktuell1);
aktuell1 = {aktuell1,'m/s'}; 
aktuell1 = strjoin(aktuell1); % Zusammenfgen von Werten & m/s
aktuell1(isspace(aktuell1))=[];% Löschen der Leerzeile zwischen Wert & m/s

% Anzeige der Windgeschwindigkeit
set(wind1, 'units','normalized','position',[0.18 0.1 0.1 0.05],...
    'FontSize',16,'string',aktuell1);
                                    
%   BEGINN TAGESVERLAUF
% Plot minimale Windrichtung 
q = grad_richtung(2,2) * pi/180; % Rechnet die Gradzahl in rad um.

[w,e]=pol2cart(q,staerke_aktuell(2,1)); % Wandelt die polaren Koordinaten in kartesische um.

axes ('Position', [0.52 0.05 0.1 0.2])

G=compass(w,e); % Erstellt einen Kompass mit der entsprechenden Windrichtung.

% Ändert die Gradzahlen um den Kompass in die Abkürzungen der Himmelsrichtungen. 
set(findall(gcf, 'String', '0'),'String', 'E');     % Ändert 0 Grad in E
set(findall(gcf, 'String', '30'),'String', 'ENE');  % Ändert 30 Grad in ENE
set(findall(gcf, 'String', '60'),'String', 'NNE');  % Ändert 60 Grad in NNE
set(findall(gcf, 'String', '90'),'String', 'N');    % Ändert 90 Grad in E
set(findall(gcf, 'String', '120'),'String', 'NNW'); % Ändert 120 Grad in NNW
set(findall(gcf, 'String', '150'),'String', 'WNW'); % Ändert 150 Grad in WNW
set(findall(gcf, 'String', '180'),'String', 'W');   % Ändert 180 Grad in W
set(findall(gcf, 'String', '210'),'String', 'WSW'); % Ändert 210 Grad in WSW
set(findall(gcf, 'String', '240'),'String', 'SSW'); % Ändert 240 Grad in SSW
set(findall(gcf, 'String', '270'),'String', 'S');   % Ändert 270 Grad in S
set(findall(gcf, 'String', '300'),'String', 'SSE'); % Ändert 300 Grad in SSE
set(findall(gcf, 'String', '330'),'String', 'ESE'); % Ändert 330 Grad in ESE
set(G,'Color','r', 'LineWidth', 3)  % Ändert Pfeilfarbe in rot und erhöht
                                    % die Strichdicke auf 3.
                                    
% Variable erstellen für uicontrol, für Textausgabe
wind2=uicontrol('style','text');
% Umformung der Werte in Strings, einfügen von m/s
verlauf1 = grad_richtung(2,1);
verlauf1 = num2str(verlauf1);
verlauf1 = {verlauf1,'m/s'}; 
verlauf1 = strjoin(verlauf1); % Zusammenfgen von Werten & m/s
verlauf1(isspace(verlauf1))=[];% Löschen der Leerzeile zwischen Wert & m/s

% Anzeige der Windgeschwindigkeit
set(wind2, 'units','normalized','position',[0.65 0.1 0.1 0.05],...
    'FontSize',16,'string',verlauf1);

% Plot Maxima 
q = grad_richtung(3,2) * pi/180; % Rechnet die Gradzahl in rad um.

[w,e]=pol2cart(q,staerke_aktuell(3,1)); % Wandelt die polaren Koordinaten in kartesische um.

axes ('Position', [0.78 0.05 0.1 0.2])

G=compass(w,e); % Erstellt einen Kompass mit der entsprechenden Windrichtung.

% Ändert die Gradzahlen um den Kompass in die Abkürzungen der Himmelsrichtungen. 
set(findall(gcf, 'String', '0'),'String', 'E');     % Ändert 0 Grad in E
set(findall(gcf, 'String', '30'),'String', 'ENE');  % Ändert 30 Grad in ENE
set(findall(gcf, 'String', '60'),'String', 'NNE');  % Ändert 60 Grad in NNE
set(findall(gcf, 'String', '90'),'String', 'N');    % Ändert 90 Grad in E
set(findall(gcf, 'String', '120'),'String', 'NNW'); % Ändert 120 Grad in NNW
set(findall(gcf, 'String', '150'),'String', 'WNW'); % Ändert 150 Grad in WNW
set(findall(gcf, 'String', '180'),'String', 'W');   % Ändert 180 Grad in W
set(findall(gcf, 'String', '210'),'String', 'WSW'); % Ändert 210 Grad in WSW
set(findall(gcf, 'String', '240'),'String', 'SSW'); % Ändert 240 Grad in SSW
set(findall(gcf, 'String', '270'),'String', 'S');   % Ändert 270 Grad in S
set(findall(gcf, 'String', '300'),'String', 'SSE'); % Ändert 300 Grad in SSE
set(findall(gcf, 'String', '330'),'String', 'ESE'); % Ändert 330 Grad in ESE
set(G,'Color','r', 'LineWidth', 3)  % Ändert Pfeilfarbe in rot und erhöht
                                    % die Strichdicke auf 3.
                                    
% Variable erstellen für uicontrol, für Textausgabe
wind3=uicontrol('style','text');
% Umformung der Werte in Strings, einfügen von m/s
verlauf2 = grad_richtung(3,1);
verlauf2 = num2str(verlauf2);
verlauf2 = {verlauf2,'m/s'}; 
verlauf2 = strjoin(verlauf2); % Zusammenfgen von Werten & m/s
verlauf2(isspace(verlauf2))=[];% Löschen der Leerzeile zwischen Wert & m/s

% Anzeige der Windgeschwindigkeit
set(wind3, 'units','normalized','position',[0.9 0.1 0.1 0.05],...
    'FontSize',16,'string',verlauf2);
end % Ende der Funktion

%--------------------Licence ---------------------------------------------
% Copyright (c) <2014> Marc Hieronimus, Joseffa Baumann