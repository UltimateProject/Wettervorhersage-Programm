%Wochenübersicht des Wetters 

% Erstellen der Figure, Anzeige der Wochenübersicht
f = figure;
set(f, 'Units', 'normalized', 'Position', [0.0, 0.05, 1, 0.88],'Color','w');

hold on

% Einlesen der Daten
datum1=uicontrol('style','text');
datum2=uicontrol('style','text');
datum3=uicontrol('style','text');
datum4=uicontrol('style','text');
datum5=uicontrol('style','text');

% Aufteilung der Tage
set(datum1,'units','normalized','position', [0.05 0.92 0.1 0.05],'FontSize',21, 'string','Tag1');
set(datum2,'units','normalized','position', [0.25 0.92 0.1 0.05],'FontSize',21, 'string','Tag2');
set(datum3,'units','normalized','position', [0.45 0.92 0.1 0.05],'FontSize',21, 'string','Tag3');
set(datum4,'units','normalized','position', [0.65 0.92 0.1 0.05],'FontSize',21, 'string','Tag4');
set(datum5,'units','normalized','position', [0.85 0.92 0.1 0.05],'FontSize',21, 'string','Tag5');

% Einlesen der Werte für 'Morgens'
morgens1=uicontrol('style','text');
morgens2=uicontrol('style','text');
morgens3=uicontrol('style','text');
morgens4=uicontrol('style','text');
morgens5=uicontrol('style','text');

% Aufteilung der Werte auf entsprechende Tage
set(morgens1,'units','normalized','position', [0.05 0.85 0.1 0.05],'FontSize',16, 'string','Temperatur');
set(morgens2,'units','normalized','position', [0.25 0.85 0.1 0.05],'FontSize',16, 'string','Temperatur');
set(morgens3,'units','normalized','position', [0.45 0.85 0.1 0.05],'FontSize',16, 'string','Temperatur');
set(morgens4,'units','normalized','position', [0.65 0.85 0.1 0.05],'FontSize',16, 'string','Temperatur');
set(morgens5,'units','normalized','position', [0.85 0.85 0.1 0.05],'FontSize',16, 'string','Temperatur');

% Einlesen der Werte für 'Mittags'
mittags1=uicontrol('style','text');
mittags2=uicontrol('style','text');
mittags3=uicontrol('style','text');
mittags4=uicontrol('style','text');
mittags5=uicontrol('style','text');

% Aufteilung der Werte auf entsprechende Tage
set(mittags1,'units','normalized','position', [0.05 0.55 0.1 0.05],'FontSize',16, 'string','Bewölkung');
set(mittags2,'units','normalized','position', [0.25 0.55 0.1 0.05],'FontSize',16, 'string','Bewölkung');
set(mittags3,'units','normalized','position', [0.45 0.55 0.1 0.05],'FontSize',16, 'string','Bewölkung');
set(mittags4,'units','normalized','position', [0.65 0.55 0.1 0.05],'FontSize',16, 'string','Bewölkung');
set(mittags5,'units','normalized','position', [0.85 0.55 0.1 0.05],'FontSize',16, 'string','Bewölkung');

% Einlesen der Werte für 'Abends'
abends1=uicontrol('style','text');
abends2=uicontrol('style','text');
abends3=uicontrol('style','text');
abends4=uicontrol('style','text');
abends5=uicontrol('style','text');

set(abends1,'units','normalized','position', [0.05 0.25 0.1 0.05],'FontSize',16, 'string','Wind');
set(abends2,'units','normalized','position', [0.25 0.25 0.1 0.05],'FontSize',16, 'string','Wind');
set(abends3,'units','normalized','position', [0.45 0.25 0.1 0.05],'FontSize',16, 'string','Wind');
set(abends4,'units','normalized','position', [0.65 0.25 0.1 0.05],'FontSize',16, 'string','Wind');
set(abends5,'units','normalized','position', [0.85 0.25 0.1 0.05],'FontSize',16, 'string','Wind');


% Ausblenden der Axen
axis off



