% Erstellen einer Figure
f = figure;
set(f, 'Units', 'normalized', 'Position', [0.0, 0.05, 1, 0.88],'Color','w');
%Anhalten der Figure
hold on

% Variable erstellen für uicontrol, für Textausgabe
datum1=uicontrol('style','text');
datum2=uicontrol('style','text');
datum3=uicontrol('style','text');
% Schriftzüge erstellen mit 'Aktuell' & 'Tagesverlauf'
set(datum1,'units','normalized','position', [0.18 0.95 0.1 0.05],...
    'FontSize',21, 'string','Aktuell');
set(datum2,'units','normalized','position', [0.62 0.95 0.2 0.05],...
    'FontSize',21, 'string','Tagesverlauf');
set(datum3,'units','normalized','position', [0.38 0.95 0.15 0.05],...
    'FontSize',21,'string',datum(1,1));


% Variable erstellen für uicontrol, für Textausgabe
morgens2=uicontrol('style','text');

% Schriftzug erstellen mit 'Temperatur'
set(morgens2,'units','normalized','position', ...
    [0.4 0.85 0.1 0.05],'FontSize',16, 'string','Temperatur');


% Variable erstellen für uicontrol, für Textausgabe
mittags2=uicontrol('style','text');

% Schriftzug erstellen mit 'Bewölkung'
set(mittags2,'units','normalized','position', ...
    [0.4 0.55 0.1 0.05],'FontSize',16, 'string','Bewölkung');

% Variable erstellen für uicontrol, für Textausgabe
abends2=uicontrol('style','text');


% Schriftzug erstellen mit 'Wind'
set(abends2,'units','normalized','position', ...
    [0.4 0.25 0.1 0.05],'FontSize',16, 'string','Wind');

% Achsen ausschalten 
 axis off

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

% Einbinden der einzelnen Funktionen für die aktuellen Tage
temptoday_out(Tag_aktuell)
cloudtoday( wolken_dichte_aktuell )
plot_winddirection( geschw_Tag_aktuell, staerke_aktuell)
