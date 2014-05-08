function [] = plot_winddirection( grad_richtung, staerke_aktuell )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

q = grad_richtung(1,2) * pi/180; % Rechnet die Gradzahl in rad um.

[w,e]=pol2cart(q,staerke_aktuell(1,1)); % Wandelt die polaren Koordinaten in kartesische um.

axes ('Position', [0.05 0.05 0.1 0.2])

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
% Variable erstellen f�r uicontrol, f�r Textausgabe
wind1=uicontrol('style','text');
% Umformung der Werte in Strings, einf�gen von m/s
aktuell1 = grad_richtung(1,1);
aktuell1 = num2str(aktuell1);
aktuell1 = {aktuell1,'m/s'}; 
aktuell1 = strjoin(aktuell1); % Zusammenfgen von Werten & m/s
aktuell1(isspace(aktuell1))=[];% L�schen der Leerzeile zwischen Wert & m/s

% Anzeige der Windgeschwindigkeit
set(wind1, 'units','normalized','position',[0.18 0.1 0.1 0.05],...
    'FontSize',16,'string',aktuell1);
                                    
%   BEGINN TAGESVERLAUF
% Plot minimale Windrichtung 
q = grad_richtung(2,2) * pi/180; % Rechnet die Gradzahl in rad um.

[w,e]=pol2cart(q,staerke_aktuell(2,1)); % Wandelt die polaren Koordinaten in kartesische um.

axes ('Position', [0.52 0.05 0.1 0.2])

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
                                    
% Variable erstellen f�r uicontrol, f�r Textausgabe
wind2=uicontrol('style','text');
% Umformung der Werte in Strings, einf�gen von m/s
verlauf1 = grad_richtung(2,1);
verlauf1 = num2str(verlauf1);
verlauf1 = {verlauf1,'m/s'}; 
verlauf1 = strjoin(verlauf1); % Zusammenfgen von Werten & m/s
verlauf1(isspace(verlauf1))=[];% L�schen der Leerzeile zwischen Wert & m/s

% Anzeige der Windgeschwindigkeit
set(wind2, 'units','normalized','position',[0.65 0.1 0.1 0.05],...
    'FontSize',16,'string',verlauf1);

% Plot Maxima 
q = grad_richtung(3,2) * pi/180; % Rechnet die Gradzahl in rad um.

[w,e]=pol2cart(q,staerke_aktuell(3,1)); % Wandelt die polaren Koordinaten in kartesische um.

axes ('Position', [0.78 0.05 0.1 0.2])

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
                                    
% Variable erstellen f�r uicontrol, f�r Textausgabe
wind3=uicontrol('style','text');
% Umformung der Werte in Strings, einf�gen von m/s
verlauf2 = grad_richtung(3,1);
verlauf2 = num2str(verlauf2);
verlauf2 = {verlauf2,'m/s'}; 
verlauf2 = strjoin(verlauf2); % Zusammenfgen von Werten & m/s
verlauf2(isspace(verlauf2))=[];% L�schen der Leerzeile zwischen Wert & m/s

% Anzeige der Windgeschwindigkeit
set(wind3, 'units','normalized','position',[0.9 0.1 0.1 0.05],...
    'FontSize',16,'string',verlauf2);
end % Ende der Funktion

%--------------------Licence ---------------------------------------------
% Copyright (c) <2014> Marc Hieronimus, Joseffa Baumann