function [] = DE_Karte()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


h_karte=figure('Units','normalized','Position',[0.3 0.2 0.4 0.6],......
        'name','Wetterdaten Oldenburg', 'numbertitle','off');
axis([4 12 49 54])
plot_google_map()
axis off
[x,y]=ginput(1);

x=num2str(x);
y=num2str(y);

Koordinaten={'http://api.met.no/weatherapi/locationforecast/1.8/?lat=',y,';lon=',x};
Koordinaten=strjoin(Koordinaten);
Koordinaten(isspace(Koordinaten))=[];

time=0.0;
h_progress=waitbar(time,'Wetterdaten werden geladen...')

daten = get_data(Koordinaten);

waitbar(time + 0.1,h_progress,'Wetterdaten werden geladen...')

[Tag_aktuell, Tage_rest] = get_temp(daten);
% ordner_windrichtung = get_windDirection(daten);

waitbar(time + 0.4,h_progress,'Wetterdaten werden geladen...')

[geschw_Tag_aktuell, geschw_Tage_rest, staerke_aktuell, staerke_Tage_rest] = get_windSpeed(daten);

waitbar(time + 0.8,h_progress,'Wetterdaten werden geladen...')

[wolken_dichte_Tage_rest, wolken_dichte_aktuell] = get_cloudiness(daten);
% [feuchtigkeit_Tag_aktuell, feuchtigkeit_Tage_rest] = get_humidity(daten);

waitbar(time + 1,h_progress,'Wetterdaten werden geladen...')

close(karte);


end