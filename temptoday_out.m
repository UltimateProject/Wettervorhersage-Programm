function [ ] = temptoday_out(Tag_aktuell)
%   Author: M. Hieronimus, J. Baumann 08.05.2014
%   Funktion zum Einlesen der Werte für die Temperatur und zum Auswählen
%   der entsprechenden Darstellungen, Übergabe an das Hauptprogramm der
%   Anzeige

% Einlesen der Bilder/Darstellungen für die Temperatur 
thermometer1 = importdata('thermometer1.png'); 
thermometer2 = importdata('thermometer5_10.png'); 
thermometer3 = importdata('thermometer10_15.png'); 
thermometer4 = importdata('thermometer15_20.png'); 
thermometer5 = importdata('thermometer20_25.png'); 
thermometer6 = importdata('thermometer25_30.png'); 
thermometer7 = importdata('thermometer0_5.png');

% BEGINN AKTUELLER TAG
% Auslesen der aktuellen Temperaturwerte des aktuellen Tages
% Bestimmen der Position der Bilder
axis off
axes ('Position', [0.05 0.65 0.05 0.18])

% if-Schleife mit der Bedingung der Eingrenzung der Temperatur, Zuweisung
% der jeweiligen Thermometerbilder. In 5 °C - Schritten
if Tag_aktuell(1,1) <= 5 
    image (thermometer2)
end

if 5 <= Tag_aktuell(1,1) && Tag_aktuell(1,1)<= 10
    image (thermometer3)
end

if 10 < Tag_aktuell(1,1) && Tag_aktuell(1,1)<= 15
    image (thermometer4)
end

if 15 < Tag_aktuell(1,1) && Tag_aktuell(1,1) <= 20
    image (thermometer5)
end 

if 20 < Tag_aktuell(1,1) && Tag_aktuell(1,1)<= 25
    image (thermometer6)
end 

if 25 < Tag_aktuell(1,1) && Tag_aktuell(1,1)<= 30
    image (thermometer7)
end 

if Tag_aktuell(1,1) >= 30
    image (thermometer1)
end
axis off

% Umformung der Werte in Strings, einfügen von °C
aktuell1 = Tag_aktuell(1,1);
aktuell1 = num2str(aktuell1);
aktuell1 = {aktuell1,'°C'}; 
aktuell1 = strjoin(aktuell1); % Zusammenfgen von Werten & °C
aktuell1(isspace(aktuell1))=[];% Löschen der Leerzeile zwischen Wert & °C

% Anzeige aktuelle Temperatur
tempaktuell = uicontrol('Style', 'text', 'Units','normalized','Position',...
                        [0.15 0.75 0.1 0.05],'FontSize',16, 'String',...
                        aktuell1);

% BEGINN TAGESVERLAUF
% Auslesen der minimalen und maximalen Temperaturwerte des aktuellen Tages
% Bestimmen der Position der Bilder
axis off
axes ('Position', [0.52 0.65 0.05 0.18])

% Mittelwert bilden, um für maximalen und minimalen Temperaturwert ein
% gemeinsames Thermometerbild zu bestimmen
t_mittel=(Tag_aktuell(2,1) + Tag_aktuell(3,1))/2 ;

% Beginn if-Abfrage mit der Bedingung der Eingrenzung der Temperatur,
% Zuweisung der jeweiligen Thermometerbilder. In 5 °C - Schritten
if t_mittel <= 5 
    image (thermometer2)
end

if 5 <= t_mittel && t_mittel<= 10
    imagesc(thermometer3)
end

if 10 < t_mittel && t_mittel<= 15
    imagesc(thermometer4)
end

if 15 < t_mittel && t_mittel <= 20
    imagesc(thermometer5)
end 

if 20 < t_mittel && t_mittel<= 25
    imagesc(thermometer6)
end 

if 25 < t_mittel && t_mittel<= 30
    imagesc(thermometer7)
end 

if t_mittel >= 30
    imagesc(thermometer1)
end
axis off



%Umwandeln des Wertes in einen String und einfügen von °C
aktuell2 = Tag_aktuell(2,1);
aktuell2 = num2str(aktuell2);
aktuell2 = {aktuell2,'°C'}; 
aktuell2 = strjoin(aktuell2);% Zusammenfgen von Werten & °C
aktuell2(isspace(aktuell2))=[];% Löschen der Leerzeile zwischen Wert & °C

% Anzeige der minimalen Temperatur 
tempmin = uicontrol('Style', 'text', 'Units','normalized','Position',...
                   [0.62 0.65 0.1 0.05],'FontSize',16,'String',...
                   aktuell2);
% Schriftfarbe ändern in blau
set(tempmin,'ForeGroundColor', 'b')
%Umwandeln des Wertes in einen String und einfügen von °C
aktuell3 = Tag_aktuell(3,1);
aktuell3 = num2str(aktuell3);
aktuell3 = {aktuell3,'°C'}; 
aktuell3 = strjoin(aktuell3);% Zusammenfgen von Werten & °C
aktuell3(isspace(aktuell3))=[]; % Löschen der Leerzeile zwischen Wert & °C

% Anzeige von maximaler Temperatur
tempmax = uicontrol('Style', 'text', 'Units','normalized','Position',...
                   [0.62 0.75 0.1 0.05],'FontSize',16, 'String', ...
                   aktuell3);
% Schriftfarbe ändern in rot
set(tempmax,'ForeGroundColor', 'r')



end

