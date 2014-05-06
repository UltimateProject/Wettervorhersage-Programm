
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

f = figure;
set(f, 'Units', 'normalized', 'Position', [0.0, 0.05, 1, 0.88],'Color','w');

hold on

% Bilder einf�gen: 
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

datum1=uicontrol('style','text');
datum2=uicontrol('style','text');
datum3=uicontrol('style','text');
datum4=uicontrol('style','text');
datum5=uicontrol('style','text');

set(datum1,'units','normalized','position', [0.18 0.95 0.1 0.05],'FontSize',21, 'string','Aktuell');
set(datum2,'units','normalized','position', [0.62 0.95 0.2 0.05],'FontSize',21, 'string','Tagesverlauf');


morgens1=uicontrol('style','text');
morgens2=uicontrol('style','text');
morgens3=uicontrol('style','text');
morgens4=uicontrol('style','text');
morgens5=uicontrol('style','text');

% set(morgens1,'units','normalized','position', [0.02 0.8 0.1 0.05],'FontSize',16, 'string','Temperatur');
set(morgens2,'units','normalized','position', [0.4 0.85 0.1 0.05],'FontSize',16, 'string','Temperatur');


mittags1=uicontrol('style','text');
mittags2=uicontrol('style','text');
mittags3=uicontrol('style','text');
mittags4=uicontrol('style','text');
mittags5=uicontrol('style','text');

% set(mittags1,'units','normalized','position', [0.02 0.55 0.1 0.05],'FontSize',16, 'string','Bew�lkung');
set(mittags2,'units','normalized','position', [0.4 0.55 0.1 0.05],'FontSize',16, 'string','Bew�lkung');



abends1=uicontrol('style','text');
abends2=uicontrol('style','text');
abends3=uicontrol('style','text');
abends4=uicontrol('style','text');
abends5=uicontrol('style','text');

% set(abends1,'units','normalized','position', [0.02 0.3 0.1 0.05],'FontSize',10, 'string','Windrichtung und Windgeschwindigkeit');
set(abends2,'units','normalized','position', [0.4 0.25 0.1 0.05],'FontSize',16, 'string','Wind');


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


% P=cell(5,5);
% figure(2)
% P{1,1}=imread('thermometer1.png');
% P{1,3}=imread('thermometer5_10.png');
% P{4,3}=imread('thermometer20_25.png');
% vektor = [0,1,2,1,2,0,1,1]; 
% image([P{vektor+1}])
% 
% axis off
% % set(gca,'Position',[0 0 1 1]) 
% 
% 
% 
% 
% figure(1)
% hold on
% subplot(1,5,1);
% image(thermometer1);
% axis off
% subplot(1,5,2);
% image(thermometer4);
% axis off
% subplot(1,5,3);
% image(thermometer2);
% axis off
% subplot(1,5,4);
% image(thermometer5);
% axis off
% subplot(1,5,5);
% image(thermometer3);
% axis off