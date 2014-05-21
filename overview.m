%Wochenübersicht des Wetters 

% Erstellen der Figure, Anzeige der Wochenübersicht
l = figure;
set(l, 'Units', 'normalized', 'Position', [0.0, 0.05, 1, 0.88],'Color','w');

hold on



% Einlesen der Daten
datum1=uicontrol('style','text');
datum2=uicontrol('style','text');
datum3=uicontrol('style','text');
datum4=uicontrol('style','text');
datum5=uicontrol('style','text');

% Aufteilung der Tage
set(datum1,'units','normalized','position', [0.05 0.92 0.12 0.05],...
    'FontSize',21, 'string',datum(1,1));
set(datum2,'units','normalized','position', [0.25 0.92 0.12 0.05],...
    'FontSize',21, 'string',datum(2,1));
set(datum3,'units','normalized','position', [0.45 0.92 0.12 0.05],...
    'FontSize',21, 'string',datum(3,1));
set(datum4,'units','normalized','position', [0.65 0.92 0.12 0.05],...
    'FontSize',21, 'string',datum(4,1));
set(datum5,'units','normalized','position', [0.85 0.92 0.12 0.05],...
    'FontSize',21, 'string',datum(5,1));

% Ausblenden der Axen
axis off

% Ausführen der Funktion für die Wochenübersicht der Temperaturen
tempweek_out(Tag_aktuell, Tage_rest)
cloudweek(wolken_dichte_aktuell, wolken_dichte_Tage_rest)
 windweek_out( geschw_Tag_aktuell, staerke_aktuell, geschw_Tage_rest, staerke_Tage_rest,richtungen_Tage_rest )
