

h_wetter=figure('Units','normalized','Position',[0.1 0.1 0.8 0.8],......
        'name','Wetterdaten Oldenburg', 'numbertitle','off');

h1=uicontrol('parent', h_wetter, 'Units', 'normalized', 'Position', [0.4 0.9 0.2 0.1],.....
   'BackgroundColor', [1 1 1], 'Style', 'pushbutton', 'FontUnits', 'normalized',....
   'Fontsize', 0.65, 'string', 'zurück','Callback', 'close(h_wetter)');

daten = get_data();
[ordner_temperatur,temperatur_tage] = get_temp(daten);
% ordner_windrichtung = get_windDirection(daten);
ordner_windgeschw = get_windSpeed(daten);
ordner_bewoelkung = get_cloudiness(daten);

