 function [ ] = cloudtoday( wolken_dichte_aktuell )
%Author: M.Hieronimus, J. Baumann 08.09.14
%   Funktion zur Übergabe der Tagesübersicht der Bewölkung


%  Einlesen der Bilddateien
 sonne = importdata('sonne.jpg');
 heiterwolkig = importdata('sonnewolken.jpg');
 wolken = importdata('wolken.jpg');

 
% BEGINN AKTUELLE BEWÖLKUNG
aktuell = wolken_dichte_aktuell(1,1);

% Bestimmung der Position der der Abbildung
 axis off
 axes ('Position', [0.05 0.35 0.1 0.2])

 % Schleife: if-Abfrage, wählen des Bildes
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
 
 % Umformung der Werte in Strings und '%' einfügen
aktuell= num2str(aktuell);
aktuell = {aktuell,'%'}; %Zusammenfügen von Wert & %
aktuell = strjoin(aktuell);
aktuell(isspace(aktuell))=[];

 waktuell = uicontrol('Style', 'text', 'Units','normalized','Position',...
                     [0.18 0.43 0.1 0.05],'FontSize',16, 'String',...
                     aktuell);

 % BEGINN BEWÖLKUNG TAGESVERLAUF
 w_mittel = (wolken_dichte_aktuell(2,1)+ wolken_dichte_aktuell(3,1))/2 ;
 
%  Beginn if-Abfrage
 axis off
 axes ('Position', [0.52 0.35 0.1 0.2])

 % Schleife: if-Abfrage, wählen des Bildes
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
 % können
 windmin = wolken_dichte_aktuell(2,1);
 windmax = wolken_dichte_aktuell(3,1);
 
 % Umformung der Werte in Strings, einfügen von '%'
windmin= num2str(windmin);
windmin = {'min.',windmin,'%'}; %Zusammenfügen von Werten & %
windmin = strjoin(windmin);
windmin(isspace(windmin))=[]; 
 
% Anzeige der minimalen Bewölkungswerte
wmin = uicontrol('Style', 'text', 'Units','normalized','Position',...
                   [0.65 0.38  0.1 0.05],'FontSize',12,'String',...
                   windmin);

% Umformung der Werte in Strings, einfügen von '%'
windmax= num2str(windmax);
windmax = {'max.',windmax,'%'}; % Zusammenfügen von Werten & %
windmax = strjoin(windmax);
windmax(isspace(windmax))=[]; 

% Anzeigen der maximalen Bewölkungswerte
wmax = uicontrol('Style', 'text', 'Units','normalized','Position',...
                   [0.65 0.5 0.1 0.05],'FontSize',12, 'String', ...
                   windmax);
 
 end
%--------------------Licence ---------------------------------------------
% Copyright (c) <2014> Marc Hieronimus, Joseffa Baumann


