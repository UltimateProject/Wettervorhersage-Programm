


h_karte=figure('Units','normalized','Position',[0.3 0.2 0.4 0.6],......
        'name','Wetterdaten Oldenburg', 'numbertitle','off');

axis([7 10 52 54])
plot_google_map('language','de')
axis off
[x,y]=ginput(1);



x=num2str(x);
y=num2str(y);

Koordinaten={'http://api.met.no/weatherapi/locationforecast/1.8/?lat=',y,';lon=',x};
Koordinaten=strjoin(Koordinaten);
Koordinaten(isspace(Koordinaten))=[];


progressbar(0)
progressbar('Wetterdaten werden geladen...')

datum_system=cell(1);
datum_system{1,1}=date;
datum_system(1,1) = cellfun(@(x) x(1:2), datum_system(1,1), 'UniformOutput', false);

progressbar(0.1)

daten = get_data(Koordinaten);

progressbar(0.3)

[Tag_aktuell, Tage_rest] = get_temp(daten);

progressbar(0.5)

[ richtung_Tag_aktuell,richtung_Tage_rest ]  = get_windDirection(daten,datum_system);

progressbar(0.7)

[geschw_Tag_aktuell, geschw_Tage_rest, staerke_aktuell, staerke_Tage_rest] = get_windSpeed(daten,datum_system);

progressbar(0.9)

[wolken_dichte_Tage_rest, wolken_dichte_aktuell] = get_cloudiness(daten);

progressbar(1)

close(h_karte);

