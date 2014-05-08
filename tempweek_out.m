<<<<<<< HEAD
function [ tempweek ] = tempweek_out( Tag_aktuell, Tage_rest )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
=======
function [ ] = tempweek_out( Tag_aktuell, Tage_rest )
% Author: M.Hieronimus, J.Baumann 08.09.14
% Funktion zur Übergabe der Wochenübersicht der Temperatur
>>>>>>> f865800ab45e4c05c36f39b5c80638b3f8015e56

% Einlesen der Bilder/Darstellungen für die Temperatur 
thermometer1 = importdata('thermometer1.png'); 
thermometer2 = importdata('thermometer5_10.png'); 
thermometer3 = importdata('thermometer10_15.png'); 
thermometer4 = importdata('thermometer15_20.png'); 
thermometer5 = importdata('thermometer20_25.png'); 
thermometer6 = importdata('thermometer25_30.png'); 
thermometer7 = importdata('thermometer0_5.png');


<<<<<<< HEAD
% BEGINN FOLGENDE TAGE
% Auslesen der einzelnen Minima und Maxima 
t1_min = Tag_aktuell(2,1);
t1_max = Tag_aktuell(3,1);
t2_min = Tage_rest();
t2_max = Tage_rest(); 
t3_min = Tage_rest();
t3_max = Tage_rest();
t4_min = Tage_rest();
t4_max = Tage_rest();
t5_min = Tage_rest();
t5_max = Tage_rest();

% Darstellung des ersten Folgetages
% Mittelwert bilden, damit entsprechende Darstellung eingefügt werden kann
t1_mittel = (t1_min + t1_max)/2;

% Auswählen der Darstellung mit Hilfe einer if-Abfrage
if t1_mittel <= 5 
    image ('thermometer0_5.png')
end
if 5 <= t1_mittel && t1_mittel<= 10
    image ('thermometer5_10.png')
end

if 10 < t1_mittel && t1_mittel<= 15
    image ('thermometer10_15.png')
end

if 15 < t1_mittel && t1_mittel <= 20
    image ('thermometer15_20.png')
end 

if 20 < t1_mittel && t1_mittel<= 25
    image ('thermometer20_25.png')
end 

if 25 < t1_mittel && t1_mittel<= 30
    image ('thermometer25_30.png')
end 

if t1_mittel >= 30
    image ('thermometer1.png')
end

% Anzeigen der minimalen und maximalen Temperatur


=======
% Auslesen der einzelnen Minima und Maxima 
t1_min = Tag_aktuell(2,1);
t1_max = Tag_aktuell(3,1);
t2_min = Tage_rest(1,1);
t2_max = Tage_rest(2,1); 
t3_min = Tage_rest(1,2);
t3_max = Tage_rest(2,2);
t4_min = Tage_rest(1,3);
t4_max = Tage_rest(2,3);
t5_min = Tage_rest(1,4);
t5_max = Tage_rest(2,4);

% DARSTELLUNG DES ERSTEN/AKTUELLEN TAGES
% Mittelwert bilden, damit entsprechende Darstellung eingefügt werden kann
t1_mittel = (t1_min + t1_max)/2;

% Bestimmung der Position der Abbildung
axis off
axes ('Position', [0.05 0.65 0.05 0.18])

% Auswählen des Bildes mit Hilfe einer if-Abfrage
if t1_mittel <= 5 
    imagesc(thermometer2)
end
if 5 <= t1_mittel && t1_mittel<= 10
    imagesc(thermometer3)
end

if 10 < t1_mittel && t1_mittel<= 15
    imagesc(thermometer4)
end

if 15 < t1_mittel && t1_mittel <= 20
    imagesc(thermometer5)
end 

if 20 < t1_mittel && t1_mittel<= 25
    imagesc(thermometer6)
end 

if 25 < t1_mittel && t1_mittel<= 30
    imagesc(thermometer7)
end 

if t1_mittel >= 30
    imagesc(thermometer1)
end
axis off

% Umformung der Werte in String, einfügen von °C
t1_max = num2str(t1_max);
t1_max = {t1_max,'°C'}; % Zusammenfügen Werte und °C
t1_max = strjoin(t1_max);
t1_max(isspace(t1_max))=[]; %Löschen der Leerzeile zwischen Wert& °C

% Anzeigen der maximalen Temperatur
tempmax1 = uicontrol('Style', 'text', 'Units','normalized','Position',...
                     [0.13 0.75 0.06 0.05],'FontSize',16, 'String', ...
                     t1_max);
                 
%Schriftfarbe von t1_max in rot ändern
set(tempmax1,'ForeGroundColor', 'r')

% Umfromung der Werte in einen String, einfügen von °C
t1_min = num2str(t1_min);
t1_min = {t1_min,'°C'}; % Zusammenfügen Werte und °C
t1_min = strjoin(t1_min);
t1_min(isspace(t1_min))=[]; %Löschen der Leerzeile zwischen Wert& °C

%Anzeigen der minimalen Temperatur
tempmin1 = uicontrol('Style', 'text', 'Units','normalized','Position',...
                     [0.13 0.65 0.06 0.05],'FontSize',16, 'String', ...
                     t1_min);
                 
%Schriftfarbe von t1_min in blau ändern
set(tempmin1,'ForeGroundColor', 'b')


% DARSTELLUNG DES ZWEITEN TAGES
% Mittelwert bilden, damit entsprechende Darstellung eingefügt werden kann
t2_mittel = (t2_min + t2_max)/2;

% Bestimmung der Position der Abbildung
axis off
axes ('Position', [0.25 0.65 0.05 0.18])

% Auswählen der Darstellung mit Hilfe einer if-Abfrage
if t2_mittel <= 5 
    imagesc(thermometer2)
end
if 5 <= t2_mittel && t2_mittel<= 10
    imagesc(thermometer3)
end

if 10 < t2_mittel && t2_mittel<= 15
    imagesc(thermometer4)
end

if 15 < t2_mittel && t2_mittel <= 20
    imagesc(thermometer5)
end 

if 20 < t2_mittel && t2_mittel<= 25
    imagesc(thermometer6)
end 

if 25 < t2_mittel && t2_mittel<= 30
    imagesc(thermometer7)
end 

if t2_mittel >= 30
    imagesc(thermometer1)
end
axis off

% Umformung der Werte in einen String, einfügen von °C
t2_max = num2str(t2_max);
t2_max = {t2_max,'°C'}; % Zusammenfügen Werte und °C
t2_max = strjoin(t2_max);
t2_max(isspace(t2_max))=[]; %Löschen der Leerzeile zwischen Wert& °C

% Anzeigen der maximalen Temperatur
tempmax2 = uicontrol('Style', 'text', 'Units','normalized','Position',...
                     [0.33 0.75 0.06 0.05],'FontSize',16, 'String', ...
                     t2_max);
    
% Ändern der Schriftfarbe von t2_max
set(tempmax2,'ForeGroundColor','r');

%Umformung der Werte in Strings, einfügen von °C
t2_min = num2str(t2_min);
t2_min = {t2_min,'°C'}; % Zusammenfügen Werte und °C
t2_min = strjoin(t2_min);
t2_min(isspace(t2_min))=[]; %Löschen der Leerzeile zwischen Wert& °C

% Anzeigen der minimalen Temperatur
tempmin2 = uicontrol('Style', 'text', 'Units','normalized','Position',...
                     [0.33 0.65 0.06 0.05],'FontSize',16, 'String', ...
                     t2_min);
                 
% Ändern der Schriftfarbe
set(tempmin2,'ForeGroundColor','b');
                 
% BEGINN DARSTELLUNG DES DRITTEN TAGES
% Mittelwert bilden, damit entsprechende Darstellung eingefügt werden kann
t3_mittel = (t3_min + t3_max)/2;

% Bestimmung der Position der Abbildung
axis off
axes ('Position', [0.45 0.65 0.05 0.18])

% Auswählen der Darstellung mit Hilfe einer if-Abfrage
if t3_mittel <= 5 
    imagesc(thermometer2)
end
if 5 <= t3_mittel && t3_mittel<= 10
    imagesc(thermometer3)
end

if 10 < t3_mittel && t3_mittel<= 15
    imagesc(thermometer4)
end

if 15 < t3_mittel && t3_mittel <= 20
    imagesc(thermometer5)
end 

if 20 < t3_mittel && t3_mittel<= 25
    imagesc(thermometer6)
end 

if 25 < t3_mittel && t3_mittel<= 30
    imagesc(thermometer7)
end 

if t3_mittel >= 30
    imagesc(thermometer1)
end
axis off

%Umformung der Werte in Strings, einfügen von °C
t3_max = num2str(t3_max);
t3_max = {t3_max,'°C'}; % Zusammenfügen Werte und °C
t3_max = strjoin(t3_max);
t3_max(isspace(t3_max))=[]; %Löschen der Leerzeile zwischen Wert& °C

% Anzeigen der maximalen Temperatur
tempmax3 = uicontrol('Style', 'text', 'Units','normalized','Position',...
                     [0.53 0.75 0.06 0.05],'FontSize',16, 'String', ...
                     t3_max);
% Ändern der Schriftfarbe von t3_max
set(tempmax3, 'ForeGroundColor','r');

% Umformung der Werte in Strings, einfügen von °C
t3_min = num2str(t3_min);
t3_min = {t3_min,'°C'}; % Zusammenfügen Werte und °C
t3_min = strjoin(t3_min);
t3_min(isspace(t3_min))=[]; %Löschen der Leerzeile zwischen Wert& °C

%Anzeigen der minimalen Temperatur
tempmin3 = uicontrol('Style', 'text', 'Units','normalized','Position',...
                     [0.53 0.65 0.06 0.05],'FontSize',16, 'String', ...
                    t3_min);
                
% Ändern der Schriftfarbe 
set(tempmin3,'ForeGroundColor','b');
                 
% DARSTELLUNG DES VIERTEN FOLGETAGES
% Mittelwert bilden, damit entsprechende Darstellung eingefügt werden kann
t4_mittel = (t4_min + t4_max)/2;

% Bestimmung der Position der Abbildung
axis off
axes ('Position', [0.65 0.65 0.05 0.18])

% Auswählen der Darstellung mit Hilfe einer if-Abfrage
if t4_mittel <= 5 
    imagesc(thermometer2)
end
if 5 <= t4_mittel && t4_mittel<= 10
    imagesc(thermometer3)
end

if 10 < t4_mittel && t4_mittel<= 15
    imagesc(thermometer4)
end

if 15 < t4_mittel && t4_mittel <= 20
    imagesc(thermometer5)
end 

if 20 < t4_mittel && t4_mittel<= 25
    imagesc(thermometer6)
end 

if 25 < t4_mittel && t4_mittel<= 30
    imagesc(thermometer7)
end 

if t4_mittel >= 30
    imagesc(thermometer1)
end
axis off
% Umfromung der Werte in Strings, einfügen von °C
t4_max = num2str(t4_max);
t4_max = {t4_max,'°C'}; % Zusammenfügen Werte und °C
t4_max = strjoin(t4_max);
t4_max(isspace(t4_max))=[]; %Löschen der Leerzeile zwischen Wert& °C

% Anzeigen der maximalen Temperatur
tempmax4 = uicontrol('Style', 'text', 'Units','normalized','Position',...
                     [0.73 0.75 0.06 0.05],'FontSize',16, 'String', ...
                     t4_max);
                 
% Ändern der Schriftfarbe
set(tempmax4,'ForeGroundColor','r');

% Umformung der Werte in Strings, einfügen von °C
t4_min = num2str(t4_min);
t4_min = {t4_min,'°C'}; % Zusammenfügen Werte und °C
t4_min = strjoin(t4_min);
t4_min(isspace(t4_min))=[]; %Löschen der Leerzeile zwischen Wert& °C

% Anzeigen der minimalen Werte
tempmin4 = uicontrol('Style', 'text', 'Units','normalized','Position',...
                     [0.73 0.65 0.06 0.05],'FontSize',16, 'String', ...
                     t4_min);
                 
% Ändern der Schriftfarbe
set(tempmin4,'ForeGroundColor','b');

                 
% DARSTELLUNG DES FÜNFTEN TAGES
% Mittelwert bilden, damit entsprechende Darstellung eingefügt werden kann
t5_mittel = (t5_min + t5_max)/2;

% Bestimmung der Position der Abbildung
axis off
axes ('Position', [0.85 0.65 0.05 0.18])

% Auswählen der Darstellung mit Hilfe einer if-Abfrage
if t5_mittel <= 5 
    imagesc(thermometer2)
end
if 5 <= t5_mittel && t5_mittel<= 10
    imagesc(thermometer3)
end

if 10 < t5_mittel && t5_mittel<= 15
    imagesc(thermometer4)
end

if 15 < t5_mittel && t5_mittel <= 20
    imagesc(thermometer5)
end 

if 20 < t5_mittel && t5_mittel<= 25
    imagesc(thermometer6)
end 

if 25 < t5_mittel && t5_mittel<= 30
    imagesc(thermometer7)
end 

if t5_mittel >= 30
    imagesc(thermometer1)
end
axis off

%Umformung der Werte in Strings, einfügen von °C
t5_max = num2str(t5_max);
t5_max = {t5_max,'°C'}; % Zusammenfügen Werte und °C
t5_max = strjoin(t5_max);
t5_max(isspace(t5_max))=[]; %Löschen der Leerzeile zwischen Wert& °C

% Anzeigen der maximalen Temperatur
tempmax5 = uicontrol('Style', 'text', 'Units','normalized','Position',...
                     [0.93 0.75 0.06 0.05],'FontSize',16, 'String', ...
                     t5_max);

% Ändern der Schriftfarbe
set(tempmax5,'ForeGroundColor','r');

%Umformung der Werte in Strings, einfügen von °C
t5_min = num2str(t5_min);
t5_min = {t5_min,'°C'}; % Zusammenfügen Werte und °C
t5_min = strjoin(t5_min);
t5_min(isspace(t5_min))=[]; %Löschen der Leerzeile zwischen Wert& °C

% Anzeigen der minimalen Temperatur
tempmin5 = uicontrol('Style', 'text', 'Units','normalized','Position',...
                     [0.93 0.65 0.06 0.05],'FontSize',16, 'String', ...
                     t5_min);
                 
% Ändern der Schriftfarbe
set(tempmin5,'ForeGroundColor', 'b');
                 
>>>>>>> f865800ab45e4c05c36f39b5c80638b3f8015e56
end

