function [  ] = windweek_out( geschw_Tag_aktuell, staerke_aktuell, geschw_Tage_rest, staerke_Tage_rest, richtungen_Tage_rest )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%PLOT AKTUELLER TAG
q = geschw_Tag_aktuell(1,2) * pi/180; % Rechnet die Gradzahl in rad um.

[w,e]=pol2cart(q,staerke_aktuell(1,1)); % Wandelt die polaren Koordinaten in kartesische um.

axes ('Position', [0.03 0.05 0.1 0.2])

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
aktuell1 = geschw_Tag_aktuell(1,1);
aktuell1 = num2str(aktuell1);
aktuell1 = {aktuell1,'m/s'}; 
aktuell1 = strjoin(aktuell1); % Zusammenfgen von Werten & m/s
aktuell1(isspace(aktuell1))=[];% Löschen der Leerzeile zwischen Wert & m/s

% Anzeige der Windgeschwindigkeit
set(wind1, 'units','normalized','position',[0.13 0.05 0.08 0.05],...
    'FontSize',16,'string',aktuell1);


% PLOT ZWEITER TAG
q = richtungen_Tage_rest(1,1) * pi/180; % Rechnet die Gradzahl in rad um.

[w,e]=pol2cart(q,staerke_Tage_rest(2,1)); % Wandelt die polaren Koordinaten in kartesische um.

axes ('Position', [0.23 0.05 0.1 0.2])

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
week2 = geschw_Tage_rest(2,1);
week2 = num2str(week2);
week2 = {week2,'m/s'}; 
week2 = strjoin(week2); % Zusammenfgen von Werten & m/s
week2(isspace(week2))=[];% Löschen der Leerzeile zwischen Wert & m/s

% Anzeige der Windgeschwindigkeit
set(wind2, 'units','normalized','position',[0.33 0.05 0.08 0.05],...
    'FontSize',16,'string',week2);

% PLOT DRITTER TAG
q = richtungen_Tage_rest(1,2) * pi/180; % Rechnet die Gradzahl in rad um.

[w,e]=pol2cart(q,staerke_Tage_rest(2,2)); % Wandelt die polaren Koordinaten in kartesische um.

axes ('Position', [0.43 0.05 0.1 0.2])

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
wind3=uicontrol('style','text');                                    
                                    
week3 = geschw_Tage_rest(2,2);
week3 = num2str(week3);
week3 = {week3,'m/s'}; 
week3 = strjoin(week3); % Zusammenfgen von Werten & m/s
week3(isspace(week3))=[];% Löschen der Leerzeile zwischen Wert & m/s

% Anzeige der Windgeschwindigkeit
set(wind3, 'units','normalized','position',[0.53 0.05 0.08 0.05],...
    'FontSize',16,'string',week3);

% PLOT VIERTER TAG
q = richtungen_Tage_rest(1,3) * pi/180; % Rechnet die Gradzahl in rad um.

[w,e]=pol2cart(q,staerke_Tage_rest(2,3)); % Wandelt die polaren Koordinaten in kartesische um.

axes ('Position', [0.63 0.05 0.1 0.2])

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
wind4=uicontrol('style','text');                                    
                                    
week4 = geschw_Tage_rest(2,3);
week4 = num2str(week4);
week4 = {week4,'m/s'}; 
week4 = strjoin(week4); % Zusammenfgen von Werten & m/s
week4(isspace(week4))=[];% Löschen der Leerzeile zwischen Wert & m/s

% Anzeige der Windgeschwindigkeit
set(wind4, 'units','normalized','position',[0.73 0.05 0.08 0.05],...
    'FontSize',16,'string',week4);

% DARSTELLUNG FÜNFTER TAG

q = richtungen_Tage_rest(1,4) * pi/180; % Rechnet die Gradzahl in rad um.

[w,e]=pol2cart(q,staerke_Tage_rest(2,4)); % Wandelt die polaren Koordinaten in kartesische um.

axes ('Position', [0.83 0.05 0.1 0.2])

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
wind5=uicontrol('style','text');                                    
                                    
week5 = geschw_Tage_rest(2,4);
week5 = num2str(week5);
week5 = {week5,'m/s'}; 
week5 = strjoin(week5); % Zusammenfgen von Werten & m/s
week5(isspace(week5))=[];% Löschen der Leerzeile zwischen Wert & m/s

% Anzeige der Windgeschwindigkeit
set(wind5, 'units','normalized','position',[0.93 0.05 0.08 0.05],...
    'FontSize',16,'string',week5);
end

