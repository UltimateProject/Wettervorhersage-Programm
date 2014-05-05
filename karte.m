
h_karte=figure('Units','normalized','Position',[0.3 0.2 0.4 0.6],......
        'name','Wetterdaten Oldenburg', 'numbertitle','off');
axis([4 12 49 54])
plot_google_map()
axis off
[x,y]=ginput(1);

