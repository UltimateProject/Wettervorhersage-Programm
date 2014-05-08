
<<<<<<< HEAD
% thermometer1=imread(thermometer1);
% thermometer1 = importdata('thermometer1.png'); 
% thermometer2 = importdata('thermometer5_10.png'); 
% thermometer3 = importdata('thermometer10_15.png'); 
% thermometer4 = importdata('thermometer15_20.png'); 
% thermometer5 = importdata('thermometer20_25.png'); 
% thermometer6 = importdata('thermometer25_30.png'); 
% thermometer7 = importdata('thermometer0_5.png'); 
% sonne = importdata('sonne.jpg');
% heiterwolkig = importdata('sonnewolken.jpg');
% wolken = importdata('wolken.jpg');



t=5;

=======
% Erstellen einer Figure
>>>>>>> f865800ab45e4c05c36f39b5c80638b3f8015e56
f = figure;
set(f, 'Units', 'normalized', 'Position', [0.0, 0.05, 1, 0.88],'Color','w');
%Anhalten der Figure
hold on
<<<<<<< HEAD

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
=======
>>>>>>> f865800ab45e4c05c36f39b5c80638b3f8015e56

% Variable erstellen für uicontrol, für Textausgabe
datum1=uicontrol('style','text');
datum2=uicontrol('style','text');

<<<<<<< HEAD
set(datum1,'units','normalized','position', [0.18 0.95 0.1 0.05],'FontSize',21, 'string','Aktuell');
set(datum2,'units','normalized','position', [0.62 0.95 0.2 0.05],'FontSize',21, 'string','Tagesverlauf');
=======
% Schriftzüge erstellen mit 'Aktuell' & 'Tagesverlauf'
set(datum1,'units','normalized','position', [0.18 0.95 0.1 0.05],...
    'FontSize',21, 'string','Aktuell');
set(datum2,'units','normalized','position', [0.62 0.95 0.2 0.05],...
    'FontSize',21, 'string','Tagesverlauf');
>>>>>>> f865800ab45e4c05c36f39b5c80638b3f8015e56


% Variable erstellen für uicontrol, für Textausgabe
morgens2=uicontrol('style','text');

<<<<<<< HEAD
% set(morgens1,'units','normalized','position', [0.02 0.8 0.1 0.05],'FontSize',16, 'string','Temperatur');
set(morgens2,'units','normalized','position', [0.4 0.85 0.1 0.05],'FontSize',16, 'string','Temperatur');
=======
% Schriftzug erstellen mit 'Temperatur'
set(morgens2,'units','normalized','position', ...
    [0.4 0.85 0.1 0.05],'FontSize',16, 'string','Temperatur');
>>>>>>> f865800ab45e4c05c36f39b5c80638b3f8015e56


% Variable erstellen für uicontrol, für Textausgabe
mittags2=uicontrol('style','text');
<<<<<<< HEAD
mittags3=uicontrol('style','text');
mittags4=uicontrol('style','text');
mittags5=uicontrol('style','text');

% set(mittags1,'units','normalized','position', [0.02 0.55 0.1 0.05],'FontSize',16, 'string','Bewölkung');
set(mittags2,'units','normalized','position', [0.4 0.55 0.1 0.05],'FontSize',16, 'string','Bewölkung');


=======
>>>>>>> f865800ab45e4c05c36f39b5c80638b3f8015e56

% Schriftzug erstellen mit 'Bewölkung'
set(mittags2,'units','normalized','position', ...
    [0.4 0.55 0.1 0.05],'FontSize',16, 'string','Bewölkung');

<<<<<<< HEAD
% set(abends1,'units','normalized','position', [0.02 0.3 0.1 0.05],'FontSize',10, 'string','Windrichtung und Windgeschwindigkeit');
set(abends2,'units','normalized','position', [0.4 0.25 0.1 0.05],'FontSize',16, 'string','Wind');
=======
>>>>>>> f865800ab45e4c05c36f39b5c80638b3f8015e56

% Variable erstellen für uicontrol, für Textausgabe
abends2=uicontrol('style','text');

<<<<<<< HEAD
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
=======
% Schriftzug erstellen mit 'Wind'
set(abends2,'units','normalized','position', ...
    [0.4 0.25 0.1 0.05],'FontSize',16, 'string','Wind');

% Achsen ausschalten 
 axis off
>>>>>>> f865800ab45e4c05c36f39b5c80638b3f8015e56

 
 % Generieren eines Push-Buttons zur Auswahl auf die 5-Tage Vorschau
 push = uicontrol ('Style', 'pushbutton','Units', 'normalized',.... 
                   'Position', [0.8 0.5 0.1 0.1],....
                   'String', '5-Tage Vorschau',....
                   'Callback', 'wochenuebersicht', 'Visible', 'on');

% Einbinden der einzelnen Funktionen für die aktuellen Tage
temptoday_out(Tag_aktuell)
cloudtoday( wolken_dichte_aktuell )
