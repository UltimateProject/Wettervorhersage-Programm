% clear all

h_wetter=figure('Units','normalized','Position',[0.1 0.1 0.8 0.8],......
        'name','Wetterdaten Oldenburg', 'numbertitle','off');

h1=uicontrol('parent', h_wetter, 'Units', 'normalized', 'Position', [0.4 0.9 0.2 0.1],.....
   'BackgroundColor', [1 1 1], 'Style', 'pushbutton', 'FontUnits', 'normalized',....
   'Fontsize', 0.65, 'string', 'zurück','Callback', 'close(h_wetter)');

daten = get_data();
[Tag_aktuell, Tage_rest] = get_temp(daten);
% ordner_windrichtung = get_windDirection(daten);
[geschw_Tag_aktuell, geschw_Tage_rest, staerke_aktuell, staerke_Tage_rest] = get_windSpeed(daten);
[wolken_dichte_Tage_rest, wolken_dichte_aktuell] = get_cloudiness(daten);
% [feuchtigkeit_Tag_aktuell, feuchtigkeit_Tage_rest] = get_humidity(daten);

