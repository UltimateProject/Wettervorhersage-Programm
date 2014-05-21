function [] = cloudweek(wolken_dichte_aktuell, wolken_dichte_Tage_rest)
%Author: M.Hieronimus, J.Baumann 08.09.14
%   Funktion zur Übergabe der Wochenübersicht der Bewölkung

%  Einlesen der Bilddateien
 sonne = importdata('sonne.jpg');
 heiterwolkig = importdata('sonnewolken.jpg');
 wolken = importdata('wolken.jpg');
 
 % Bestimmung der Maxima, Minima für die jeweiligen Tage
 w1_min = wolken_dichte_aktuell(2,1);
 w1_max = wolken_dichte_aktuell(3,1);
 w2_min = wolken_dichte_Tage_rest(1,1);
 w2_max = wolken_dichte_Tage_rest(2,1);
 w3_min = wolken_dichte_Tage_rest(1,2);
 w3_max = wolken_dichte_Tage_rest(2,2);
 w4_min = wolken_dichte_Tage_rest(1,3);
 w4_max = wolken_dichte_Tage_rest(2,3);
 w5_min = wolken_dichte_Tage_rest(1,4);
 w5_max = wolken_dichte_Tage_rest(2,4);
 
 % BEGINN TAG 1
 % Mittelwert bilden 
 w1_mittel = (w1_min + w1_max)/2;
 
 % Axen ausschalten und Position des Bildes bestimmen
 axis off
 axes ('Position', [0.03 0.35 0.075 0.15])

 %if-Abfrage: Zuweisung des Bildes
 if w1_mittel<= 40
     imagesc(sonne);
 end
 
 if 40 < w1_mittel && w1_mittel <= 70
     imagesc(heiterwolkig);
 end
 
 if 70 < w1_mittel
     imagesc(wolken);
 end
 axis off
 
 %Umformung der Werte in Strings, einfügen von '%'
w1_min= num2str(w1_min);
w1_min = {'min.',w1_min,'%'};
w1_min = strjoin(w1_min); %Zusammenfügen von Wert & %
w1_min(isspace(w1_min))=[];%Löschen der Leerzeile zwischen Wert & %

 % Anzeige der minimalen Bewölkungsdichte
 wmin1 = uicontrol('Style', 'text', 'Units','normalized','Position',...
                   [0.11 0.35  0.06 0.05],'FontSize',12,'String',w1_min);

%  Umformung der Werte in Strings, einfügen von '%' 
w1_max= num2str(w1_max);
w1_max = {'max.',w1_max,'%'};
w1_max = strjoin(w1_max);%Zusammenfügen von Wert & %
w1_max(isspace(w1_max))=[];%Löschen der Leerzeile zwischen Wert & %

% Anzeige der maximalen Bewölkungsdichte
wmax1 = uicontrol('Style', 'text', 'Units','normalized','Position',...
                   [0.11 0.45 0.06 0.05],'FontSize',12, 'String', w1_max);
               
               
% BEGINN TAG 2
 % Mittelwert bilden 
 w2_mittel = (w2_min + w2_max)/2;
 
 % Achsen aussschalten und Position des Bildes bestimmen
 axis off
 axes ('Position', [0.23 0.35 0.075 0.15])

 % if-Abfrage: Zuweisung des Bildes
 if w2_mittel<= 40
     imagesc(sonne);
 end
 
 if 40 < w2_mittel && w2_mittel <= 70
     imagesc(heiterwolkig);
 end
 
 if 70 < w2_mittel
     imagesc(wolken);
 end
 axis off
 
%Umformung der Werte in Strings, einfügen von '%'
w2_min= num2str(w2_min);
w2_min = {'min.',w2_min,'%'};
w2_min = strjoin(w2_min);%Zusammenfügen von Wert & %
w2_min(isspace(w2_min))=[];%Löschen der Leerzeile zwischen Wert & %

 % Anzeige minimalen der Bewölkungsdichte
 wmin2 = uicontrol('Style', 'text', 'Units','normalized','Position',...
                   [0.31 0.35  0.06 0.05],'FontSize',12,'String',w2_min);

%Umformung der Werte in Strings, einfügen von '%'
w2_max= num2str(w2_max);
w2_max = {'max.',w2_max,'%'};
w2_max = strjoin(w2_max);%Zusammenfügen von Wert & %
w2_max(isspace(w2_max))=[];%Löschen der Leerzeile zwischen Wert & %

% Anzeige maximalen der Bewölkungsdichte
wmax2 = uicontrol('Style', 'text', 'Units','normalized','Position',...
                   [0.31 0.45 0.06 0.05],'FontSize',12, 'String', w2_max); 
               
               
 % BEGINN TAG 3
 % Mittelwert bilden 
 w3_mittel = (w3_min + w3_max)/2;
 % Achsen ausblenden und Position des Bildes bestimmen
 axis off
 axes ('Position', [0.43 0.35 0.075 0.15])

 % if-Abfrage: Zuweisung des Bildes
 if w3_mittel<= 40
     imagesc(sonne);
 end
 
 if 40 < w3_mittel && w3_mittel <= 70
     imagesc(heiterwolkig);
 end
 
 if 70 < w3_mittel
     imagesc(wolken);
 end
 axis off
 
 %Umformung der Werte in Strings, einfügen von '%'
w3_min= num2str(w3_min);
w3_min = {'min.',w3_min,'%'};
w3_min = strjoin(w3_min);%Zusammenfügen von Wert & %
w3_min(isspace(w3_min))=[];%Löschen der Leerzeile zwischen Wert & %
 
 % Anzeige minimalen der Bewölkungsdichte
 wmin3 = uicontrol('Style', 'text', 'Units','normalized','Position',...
                   [0.51 0.35  0.06 0.05],'FontSize',12,'String',w3_min);
               
%Umformung der Werte in Strings, einfügen von '%'
w3_max= num2str(w3_max);
w3_max = {'max.',w3_max,'%'};
w3_max = strjoin(w3_max);%Zusammenfügen von Wert & %
w3_max(isspace(w3_max))=[];%Löschen der Leerzeile zwischen Wert & %

% Anzeige maximalen der Bewölkungsdichte
wmax3 = uicontrol('Style', 'text', 'Units','normalized','Position',...
                   [0.51 0.45 0.06 0.05],'FontSize',12, 'String', w3_max);
               
% BEGINN TAG 4
 % Mittelwert bilden 
 w4_mittel = (w4_min + w4_max)/2;
 % Achsen ausblenden und Position des Bildes bestimmen
 axis off
 axes ('Position', [0.63 0.35 0.075 0.15])

 % if-Abfrage: Zuweisung des Bildes
 if w4_mittel<= 40
     imagesc(sonne);
 end
 
 if 40 < w4_mittel && w4_mittel <= 70
     imagesc(heiterwolkig);
 end
 
 if 70 < w4_mittel
     imagesc(wolken);
 end
 axis off
 
%Umformung der Werte in Strings, einfügen von '%'
w4_min= num2str(w4_min);
w4_min = {'min.',w4_min,'%'};
w4_min = strjoin(w4_min);%Zusammenfügen von Wert & %
w4_min(isspace(w4_min))=[];%Löschen der Leerzeile zwischen Wert & %

% Anzeige der minimalen Bewölkungsdichte
wmin4 = uicontrol('Style', 'text', 'Units','normalized','Position',...
                   [0.71 0.35  0.06 0.05],'FontSize',12,'String',w4_min);
               
%Umformung der Werte in Strings, einfügen von '%'
w4_max= num2str(w4_max);
w4_max = {'max.',w4_max,'%'};
w4_max = strjoin(w4_max);%Zusammenfügen von Wert & %
w4_max(isspace(w4_max))=[];%Löschen der Leerzeile zwischen Wert & %
               
% Anzeige der maximalen Bewölkungsdichte
wmax4 = uicontrol('Style', 'text', 'Units','normalized','Position',...
                   [0.71 0.45 0.06 0.05],'FontSize',12, 'String', w4_max); 
               
               
% BEGINN TAG 5
 % Mittelwert bilden 
 w5_mittel = (w5_min + w5_max)/2;
 % Achsen ausblenden, Position des Bildes bestimmt
 axis off
 axes ('Position', [0.83 0.35 0.075 0.15])

 % if-Abfrage: Zuweisung des Bildes
 if w5_mittel<= 40
     imagesc(sonne);
 end
 
 if 40 < w5_mittel && w5_mittel <= 70
     imagesc(heiterwolkig);
 end
 
 if 70 < w5_mittel
     imagesc(wolken);
 end
 axis off
 
%Umformung der Werte in Strings, einfügen von '%'
w5_min= num2str(w5_min);
w5_min = {'min.',w5_min,'%'};
w5_min = strjoin(w5_min);%Zusammenfügen von Wert & %
w5_min(isspace(w5_min))=[];%Löschen der Leerzeile zwischen Wert & %

 % Anzeige der minimalen Bewölkungsdichte
 wmin5 = uicontrol('Style', 'text', 'Units','normalized','Position',...
                   [0.91 0.35  0.06 0.05],'FontSize',12,'String',w5_min);
               
%Umformung der Werte in Strings, einfügen von '%'
w5_max= num2str(w5_max);
w5_max = {'max.',w5_max,'%'};
w5_max = strjoin(w5_max);%Zusammenfügen von Wert & %
w5_max(isspace(w5_max))=[]; %Löschen der Leerzeile zwischen Wert & %
               
% Anzeige der maximalen Bewölkungsdichte
wmax5 = uicontrol('Style', 'text', 'Units','normalized','Position',...
                   [0.91 0.45 0.06 0.05],'FontSize',12, 'String', w5_max);               
end
%--------------------Licence ---------------------------------------------
% Copyright (c) <2014> Marc Hieronimus, Joseffa Baumann