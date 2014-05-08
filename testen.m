
% Variable erstellen für uicontrol, für Textausgabe
datum1=uicontrol('style','text');
datum2=uicontrol('style','text');


set(datum1,'units','normalized','position', [0.18 0.95 0.1 0.05],'FontSize',21, 'string','Aktuell');
set(datum2,'units','normalized','position', [0.62 0.95 0.2 0.05],'FontSize',21, 'string','Tagesverlauf');

% Schriftzüge erstellen mit 'Aktuell' & 'Tagesverlauf'
set(datum1,'units','normalized','position', [0.18 0.95 0.1 0.05],...
    'FontSize',21, 'string','Aktuell');
set(datum2,'units','normalized','position', [0.62 0.95 0.2 0.05],...
    'FontSize',21, 'string','Tagesverlauf');



% Variable erstellen für uicontrol, für Textausgabe
morgens2=uicontrol('style','text');


% set(morgens1,'units','normalized','position', [0.02 0.8 0.1 0.05],'FontSize',16, 'string','Temperatur');
set(morgens2,'units','normalized','position', [0.4 0.85 0.1 0.05],'FontSize',16, 'string','Temperatur');

% Schriftzug erstellen mit 'Temperatur'
set(morgens2,'units','normalized','position', ...
    [0.4 0.85 0.1 0.05],'FontSize',16, 'string','Temperatur');



% Variable erstellen für uicontrol, für Textausgabe
mittags2=uicontrol('style','text');
<<<<<<< HEAD
mittags3=uicontrol('style','text');
mittags4=uicontrol('style','text');
mittags5=uicontrol('style','text');

% set(mittags1,'units','normalized','position', [0.02 0.55 0.1 0.05],'FontSize',16, 'string','Bewölkung');
set(mittags2,'units','normalized','position', [0.4 0.55 0.1 0.05],'FontSize',16, 'string','Bewölkung');




% Schriftzug erstellen mit 'Bewölkung'
set(mittags2,'units','normalized','position', ...
    [0.4 0.55 0.1 0.05],'FontSize',16, 'string','Bewölkung');

<<<<<<< HEAD
% set(abends1,'units','normalized','position', [0.02 0.3 0.1 0.05],'FontSize',10, 'string','Windrichtung und Windgeschwindigkeit');
set(abends2,'units','normalized','position', [0.4 0.25 0.1 0.05],'FontSize',16, 'string','Wind');


% Variable erstellen für uicontrol, für Textausgabe
abends2=uicontrol('style','text');


 axis off
% axes('Position', [0.1 0.6 0.05 0.1])
% if t==2
% image(thermometer7)
% end
% if t==5
% image(thermometer6)
% end
% axis image
% axis off
% 
% axes('Position', [0.5 0.3 0.1 0.2])
% image(thermometer3)
% axis image
% axis off

% Push Botton für Wochenübersicht
% hold on 
 push = uicontrol ('Style', 'pushbutton', 'Position', [0.88 0.9 0.1 0.1],....
                   'Units', 'normalized', 'String', '5-Tage Vorschau',....
                   'Callback', 'wochenuebersicht', 'Visible', 'on');

% Schriftzug erstellen mit 'Wind'
set(abends2,'units','normalized','position', ...
    [0.4 0.25 0.1 0.05],'FontSize',16, 'string','Wind');

% Achsen ausschalten 
 axis off


 
 % Generieren eines Push-Buttons zur Auswahl auf die 5-Tage Vorschau
 push = uicontrol ('Style', 'pushbutton','Units', 'normalized',.... 
                   'Position', [0.8 0.5 0.1 0.1],....
                   'String', '5-Tage Vorschau',....
                   'Callback', 'wochenuebersicht', 'Visible', 'on');

% Einbinden der einzelnen Funktionen für die aktuellen Tage
temptoday_out(Tag_aktuell)
cloudtoday( wolken_dichte_aktuell )
