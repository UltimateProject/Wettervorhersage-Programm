function [ temptoday ] = temptoday_out( Tag_aktuell )
%   Author: M. Hieronimus, J. Baumann 08
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

% Bilder einfügen: 
% axis off
% axes ('Position', [1 1 1 1])
% if t==2
% image (bla)
% end
% if t==5
% image(bla2)
% end 
% axis image
% axis off

% BEGINN AKTUELLER TAG
% Auslesen der aktuellen Temperaturwerte des aktuellen Tages
% Bestimmen der Position der Bilder
axis off
axes ('Position', [0.2 0.8 0.2 0.2])
if Tag_aktuell(1,1) <= 5 
    image ('thermometer0_5.png')
end

if 5 <= Tag_aktuell(1,1) && Tag_aktuell(1,1)<= 10
    image ('thermometer5_10.png')
end

if 10 < Tag_aktuell(1,1) && Tag_aktuell(1,1)<= 15
    image ('thermometer10_15.png')
end

if 15 < Tag_aktuell(1,1) && Tag_aktuell(1,1) <= 20
    image ('thermometer15_20.png')
end 

if 20 < Tag_aktuell(1,1) && Tag_aktuell(1,1)<= 25
    image ('thermometer20_25.png')
end 

if 25 < Tag_aktuell(1,1) && Tag_aktuell(1,1)<= 30
    image ('thermometer25_30.png')
end 

if Tag_aktuell(1,1) >= 30
    image ('thermometer1.png')
end

% Auslesen der minimalen und maximalen Temperaturwerte des aktuellen Tages
% Bestimmen der Position der Bilder
axis off
axes ('Position', [0.52 0.8 0.2 0.2])

t_mittel = 0;
t_mittel=(Tag_aktuell(2,1) + Tag_aktuell(3,1))/2 ;

if t_mittel <= 5 
    image ('thermometer0_5.png')
end

if 5 <= t_mittel && t_mittel<= 10
    image ('thermometer5_10.png')
end

if 10 < t_mittel && t_mittel<= 15
    image ('thermometer10_15.png')
end

if 15 < t_mittel && t_mittel <= 20
    image ('thermometer15_20.png')
end 

if 20 < t_mittel && t_mittel<= 25
    image ('thermometer20_25.png')
end 

if 25 < t_mittel && t_mittel<= 30
    image ('thermometer25_30.png')
end 

if t_mittel >= 30
    image ('thermometer1.png')
end

% Anzeigen der maximalen und minimalen Werte des aktuellen Tages
t_min = Tag_aktuell(2,1);
t_max = Tag_aktuell(3,1);
tempmin = uicontrol('Style','text');
tempmax = uicontrol('Style','text');

set('tempmax', 'units','normalized','position', [0.74 0.8 0.1 0.05], ...
     'FontSize', 16,  'ColorSpec', [1 0 0], 'string', t_max);
 
set('tempmin','units','normalized','position', [0.74 0.7 0.1 0.05], ...
     'FontSize', 16,  'ColorSpec', [0 0 1], 'string', t_min);
end

