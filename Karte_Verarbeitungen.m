% Erstellt eine Figure die als Fenster f�r das Hauptmen� dient. ES werden
% diverse Parameter wie z.B. Startposition, Gr��e, �berschrift etc.
% festgelegt.
h_karte=figure('Units','normalized','Position',[0.1 0.1 0.7 0.7],......
               'name','Wetterdaten Oldenburg', 'numbertitle','off');

% Erstellt Gr��e �ber das gesamte Fenster.
ah = axes('unit', 'normalized', 'position', [0 0 1 1]);

% Legt den Ausschnitt der importierten Karte fest.
axis([7 10 52 54])

% Ruft die Funktion auf, die die Karte zur Auswahl des Ortes erstellt auf
% deutsch auf.
plot_google_map('language','de')

axis off  % Entfernt die sichtbaren Achsenbeschriftungen. 

% �bertr�gt die Koordinaten bei klick auf die Karte in die Variablen.
[x,y]=ginput(1);

% Verhindert das der Hintergrund �bergeplottet wird und entfernt parallel
% die Achsen.
set(ah,'handlevisibility','off','visible','off')

% Garantiert dass das Hintergundbild hinter allem anderen liegt.
uistack(ah, 'bottom');
    
x=num2str(x);  % Wandelt die x-Koordinate vom double-Wert in einen String.
y=num2str(y);  % Wandelt die y-Koordinate vom double-Wert in einen String.

% F�gt die Inhalte der Variablen in die vorgefertigte URL.
Koordinaten={'http://api.met.no/weatherapi/locationforecast/1.8/?lat=',y,';lon=',x};
Koordinaten=strjoin(Koordinaten); % F�gt die Einzelteile zusammmen.
Koordinaten(isspace(Koordinaten))=[]; % Entfernt die L�cken aus der URL.


progressbar(0)  % Initialisiert den Ladebalken.
progressbar('Wetterdaten werden geladen...') % F�gt die Beschriftung in dem 
                                             % Ladebalken hinzu.

datum_system=cell(1);       % Erstellt ein Cell-Array. 
datum_system{1,1}=date;     % Ermittelt das Datum des Systems.
% Formatiert das Datum um. Es werden nur die beiden ersten Ziffern
% behalten. Sie dienen sp�ter zum Vergleich.
datum_system(1,1) = cellfun(@(x) x(1:2), datum_system(1,1), 'UniformOutput', false);

% Erweitert den Ladebalken auf 10 Prozent
progressbar(0.1)

% �ffnent die Funktion die, mit Hilfe der zuvor erstellten URL, die XML-Datei
% mit den Wetterdaten aus dem Internet herunterl�dt. Diese Daten werden 
% angepasst zur�ckgegeben. 
daten = get_data(Koordinaten);

% Erweitert den Ladebalken auf 30 Prozent
progressbar(0.3)

% Diese Funktion ermittelt die Temperaturen des aktuellen Tages sowie die
% maximalen und minimalen Temperaturen der darauffolgenden 4 Tage. 
[Tag_aktuell, Tage_rest, datum] = get_temp(daten,datum_system);

% Erweitert den Ladebalken auf 50 Prozent
progressbar(0.5)


% Erweitert den Ladebalken auf 70 Prozent
progressbar(0.7)

% Diese Funktion ermittelt die Windgeschwindigkeiten des aktuellen Tages 
% sowie die maximalen und minimalen Windgeschwindigkeiten der darauf-
% folgenden 4 Tage.
[geschw_Tag_aktuell, geschw_Tage_rest, staerke_aktuell, staerke_Tage_rest, richtungen_Tage_rest] = get_windSpeed(daten,datum_system);

% Erweitert den Ladebalken auf 90 Prozent
progressbar(0.9)

% Diese Funktion ermittelt die Bew�lkung des aktuellen Tages sowie die
% maximalen und minimalen Bew�lkung der darauf folgenden 4 Tage.
[wolken_dichte_Tage_rest, wolken_dichte_aktuell] = get_cloudiness(daten,datum_system);

% plot_winddirection( richtung_Tag_aktuell(1,1) )

% Erweitert den Ladebalken auf 100 Prozent und schlie�t sie anschlie�end.
progressbar(1) 

% % Schlie�t die Karte.
% close(h_karte);
% 
% % �ffnet das Hauptmen�.
% Wetterprogramm_main


%--------------------Licence ---------------------------------------------
% Copyright (c) <2014> Marc Hieronimus, Joseffa Baumann
