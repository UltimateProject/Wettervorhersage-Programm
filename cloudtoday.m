 function [ ] = cloudtoday( wolken_dichte_aktuell )
%Author: M.Hieronimus, J. Baumann 08.09.14
%   Funktion zur �bergabe der Tages�bersicht der Bew�lkung


%  Einlesen der Bilddateien
 sonne = importdata('sonne.jpg');
 heiterwolkig = importdata('sonnewolken.jpg');
 wolken = importdata('wolken.jpg');

 
% BEGINN AKTUELLE BEW�LKUNG
aktuell = wolken_dichte_aktuell(1,1);

% Bestimmung der Position der der Abbildung
 axis off
 axes ('Position', [0.05 0.35 0.1 0.2])

 % Schleife: if-Abfrage, w�hlen des Bildes
 if aktuell<= 40
     imagesc(sonne);
 end
 
 if 40 < aktuell && aktuell <= 70
     imagesc(heiterwolkig);
 end
 
 if 70 < aktuell
     imagesc(wolken);
 end
 axis off
 
 % Umformung der Werte in Strings und '%' einf�gen
aktuell= num2str(aktuell);
aktuell = {aktuell,'%'}; %Zusammenf�gen von Wert & %
aktuell = strjoin(aktuell);
aktuell(isspace(aktuell))=[];

 waktuell = uicontrol('Style', 'text', 'Units','normalized','Position',...
                     [0.18 0.43 0.1 0.05],'FontSize',16, 'String',...
                     aktuell);

 % BEGINN BEW�LKUNG TAGESVERLAUF
 w_mittel = (wolken_dichte_aktuell(2,1)+ wolken_dichte_aktuell(3,1))/2 ;
 
%  Beginn if-Abfrage
 axis off
 axes ('Position', [0.52 0.35 0.1 0.2])

 % Schleife: if-Abfrage, w�hlen des Bildes
 if w_mittel <= 40
     imagesc(sonne);
 end
 
 if 40 < w_mittel && w_mittel <= 70
     imagesc(heiterwolkig);
 end
 
 if 70 < w_mittel
     imagesc(wolken);
 end
 axis off
 
 % Deklaration der Werte, damit diese in Strings umgeschrieben werden
 % k�nnen
 windmin = wolken_dichte_aktuell(2,1);
 windmax = wolken_dichte_aktuell(3,1);
 
 % Umformung der Werte in Strings, einf�gen von '%'
windmin= num2str(windmin);
windmin = {'min.',windmin,'%'}; %Zusammenf�gen von Werten & %
windmin = strjoin(windmin);
windmin(isspace(windmin))=[]; 
 
% Anzeige der minimalen Bew�lkungswerte
wmin = uicontrol('Style', 'text', 'Units','normalized','Position',...
                   [0.65 0.38  0.1 0.05],'FontSize',12,'String',...
                   windmin);

% Umformung der Werte in Strings, einf�gen von '%'
windmax= num2str(windmax);
windmax = {'max.',windmax,'%'}; % Zusammenf�gen von Werten & %
windmax = strjoin(windmax);
windmax(isspace(windmax))=[]; 

% Anzeigen der maximalen Bew�lkungswerte
wmax = uicontrol('Style', 'text', 'Units','normalized','Position',...
                   [0.65 0.5 0.1 0.05],'FontSize',12, 'String', ...
                   windmax);
 
 end
%--------------------Licence ---------------------------------------------
% Copyright (c) <2014> Marc Hieronimus, Joseffa Baumann


