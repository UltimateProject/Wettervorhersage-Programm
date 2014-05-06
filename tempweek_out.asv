function [ tempweek ] = tempweek_out( Tag_aktuell, Tage_rest )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Einlesen der Bilder/Darstellungen für die Temperatur 
thermometer1 = importdata('thermometer1.png'); 
thermometer2 = importdata('thermometer5_10.png'); 
thermometer3 = importdata('thermometer10_15.png'); 
thermometer4 = importdata('thermometer15_20.png'); 
thermometer5 = importdata('thermometer20_25.png'); 
thermometer6 = importdata('thermometer25_30.png'); 
thermometer7 = importdata('thermometer0_5.png');


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


end

