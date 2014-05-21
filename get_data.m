function [ daten ] = get_data(Koordinaten)
% Diese Funktion l�dt die Wetterinformationen der jeweiligen Orte aus dem
% Internet und wandelt zur weiteren Verarbeitung um.

urlwrite(Koordinaten,'weather.xml'); % L�dt die Informationen aus dem Internet.

xml = xmlread('weather.xml'); % �bertr�gt die Informationen in xml.

daten=parse_xml(xml); % Wandelt die Informationen um.

end % Ende der Funktion.

%--------------------Licence ---------------------------------------------
% Copyright (c) <2014> Marc Hieronimus, Joseffa Baumann