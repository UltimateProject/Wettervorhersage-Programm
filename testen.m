<<<<<<< HEAD
=======
% Erstellen einer Figure
f = figure;
set(f, 'Units', 'normalized', 'Position', [0.0, 0.05, 1, 0.88],'Color','w');
%Anhalten der Figure
hold on
>>>>>>> b3ca95ad11d4b7f84d17f4b7a26aa5550858f32a

% Variable erstellen f�r uicontrol, f�r Textausgabe
datum1=uicontrol('style','text');
datum2=uicontrol('style','text');

<<<<<<< HEAD

set(datum1,'units','normalized','position', [0.18 0.95 0.1 0.05],'FontSize',21, 'string','Aktuell');
set(datum2,'units','normalized','position', [0.62 0.95 0.2 0.05],'FontSize',21, 'string','Tagesverlauf');

=======
>>>>>>> b3ca95ad11d4b7f84d17f4b7a26aa5550858f32a
% Schriftz�ge erstellen mit 'Aktuell' & 'Tagesverlauf'
set(datum1,'units','normalized','position', [0.18 0.95 0.1 0.05],...
    'FontSize',21, 'string','Aktuell');
set(datum2,'units','normalized','position', [0.62 0.95 0.2 0.05],...
    'FontSize',21, 'string','Tagesverlauf');



% Variable erstellen f�r uicontrol, f�r Textausgabe
morgens2=uicontrol('style','text');

<<<<<<< HEAD

% set(morgens1,'units','normalized','position', [0.02 0.8 0.1 0.05],'FontSize',16, 'string','Temperatur');
set(morgens2,'units','normalized','position', [0.4 0.85 0.1 0.05],'FontSize',16, 'string','Temperatur');

% Schriftzug erstellen mit 'Temperatur'
set(morgens2,'units','normalized','position', ...
    [0.4 0.85 0.1 0.05],'FontSize',16, 'string','Temperatur');

=======
% Schriftzug erstellen mit 'Temperatur'
set(morgens2,'units','normalized','position', ...
    [0.4 0.85 0.1 0.05],'FontSize',16, 'string','Temperatur');
>>>>>>> b3ca95ad11d4b7f84d17f4b7a26aa5550858f32a


% Variable erstellen f�r uicontrol, f�r Textausgabe
mittags2=uicontrol('style','text');
<<<<<<< HEAD
<<<<<<< HEAD
mittags3=uicontrol('style','text');
mittags4=uicontrol('style','text');
mittags5=uicontrol('style','text');

% set(mittags1,'units','normalized','position', [0.02 0.55 0.1 0.05],'FontSize',16, 'string','Bew�lkung');
set(mittags2,'units','normalized','position', [0.4 0.55 0.1 0.05],'FontSize',16, 'string','Bew�lkung');



=======
>>>>>>> b3ca95ad11d4b7f84d17f4b7a26aa5550858f32a

% Schriftzug erstellen mit 'Bew�lkung'
set(mittags2,'units','normalized','position', ...
    [0.4 0.55 0.1 0.05],'FontSize',16, 'string','Bew�lkung');

<<<<<<< HEAD
<<<<<<< HEAD
% set(abends1,'units','normalized','position', [0.02 0.3 0.1 0.05],'FontSize',10, 'string','Windrichtung und Windgeschwindigkeit');
set(abends2,'units','normalized','position', [0.4 0.25 0.1 0.05],'FontSize',16, 'string','Wind');


% Variable erstellen f�r uicontrol, f�r Textausgabe
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

% Push Botton f�r Wochen�bersicht
% hold on 
 push = uicontrol ('Style', 'pushbutton', 'Position', [0.88 0.9 0.1 0.1],....
                   'Units', 'normalized', 'String', '5-Tage Vorschau',....
                   'Callback', 'wochenuebersicht', 'Visible', 'on');

=======
% Variable erstellen f�r uicontrol, f�r Textausgabe
abends2=uicontrol('style','text');


>>>>>>> b3ca95ad11d4b7f84d17f4b7a26aa5550858f32a
% Schriftzug erstellen mit 'Wind'
set(abends2,'units','normalized','position', ...
    [0.4 0.25 0.1 0.05],'FontSize',16, 'string','Wind');

% Achsen ausschalten 
 axis off
<<<<<<< HEAD

=======
>>>>>>> b3ca95ad11d4b7f84d17f4b7a26aa5550858f32a

hold on
 
 % Generieren eines Push-Buttons zur Auswahl auf die 5-Tage Vorschau
%  push = uicontrol ('Style', 'pushbutton','Units', 'normalized',.... 
%                    'Position', [0.8 0.5 0.1 0.1],....
%                    'String', '5-Tage Vorschau',....
%                    'Callback', 'wochenuebersicht', 'Visible', 'on');
button = uicontrol ('Style', 'pushbutton', 'Units', 'normalized',...
                    'Position', [0.8 0.5 0.1 0.1],...
                    'String', '5-Tage Vorschau',...
                    'Callback', 'overview');
% wochenuebersicht

% Einbinden der einzelnen Funktionen f�r die aktuellen Tage
temptoday_out(Tag_aktuell)
cloudtoday( wolken_dichte_aktuell )
