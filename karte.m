
h_karte=figure('Units','normalized','Position',[0.3 0.2 0.4 0.6],......
        'name','Wetterdaten Oldenburg', 'numbertitle','off');
axis([4 12 49 54])
plot_google_map()
axis off
[x,y]=ginput(1);

x=num2str(x);
y=num2str(y);

w={'http://api.met.no/weatherapi/locationforecast/1.8/?lat=',y,';lon=',x}
w=strjoin(w)
w(isspace(w))=[]

%('http://api.met.no/weatherapi/locationforecast/1.8/?lat=53.143889;lon=8.213889','weather.xml');