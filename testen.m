
% thermometer1=imread(thermometer1);
thermometer1 = importdata('thermometer1.png'); 
thermometer2 = importdata('thermometer5_10.png'); 
thermometer3 = importdata('thermometer10_15.png'); 
thermometer4 = importdata('thermometer15_20.png'); 
thermometer5 = importdata('thermometer20_25.png'); 
thermometer6 = importdata('thermometer25_30.png'); 
thermometer7 = importdata('thermometer0_5.png'); 


t=5;

f = figure;
set(f, 'Units', 'normalized', 'Position', [0.0, 0.05, 1, 0.88],'Color','w');

hold on
s=uicontrol('Style', 'popup',...
           'String', 'Morgens|Mittags|Abends|Nachts',...
           'Position', [20 400 100 100]);

datum1=uicontrol('style','text');
datum2=uicontrol('style','text');
datum3=uicontrol('style','text');
datum4=uicontrol('style','text');
datum5=uicontrol('style','text');

set(datum1,'units','normalized','position', [0.05 0.9 0.1 0.05],'FontSize',16, 'string','Montag');
set(datum2,'units','normalized','position', [0.25 0.9 0.1 0.05],'FontSize',16, 'string','Montag');
set(datum3,'units','normalized','position', [0.45 0.9 0.1 0.05],'FontSize',16, 'string','Montag');
set(datum4,'units','normalized','position', [0.65 0.9 0.1 0.05],'FontSize',16, 'string','Montag');
set(datum5,'units','normalized','position', [0.85 0.9 0.1 0.05],'FontSize',16, 'string','Montag');


morgens1=uicontrol('style','text');
morgens2=uicontrol('style','text');
morgens3=uicontrol('style','text');
morgens4=uicontrol('style','text');
morgens5=uicontrol('style','text');

set(morgens1,'units','normalized','position', [0.05 0.8 0.1 0.05],'FontSize',16, 'string','Morgens');
set(morgens2,'units','normalized','position', [0.25 0.8 0.1 0.05],'FontSize',16, 'string','Morgens');
set(morgens3,'units','normalized','position', [0.45 0.8 0.1 0.05],'FontSize',16, 'string','Morgens');
set(morgens4,'units','normalized','position', [0.65 0.8 0.1 0.05],'FontSize',16, 'string','Morgens');
set(morgens5,'units','normalized','position', [0.85 0.8 0.1 0.05],'FontSize',16, 'string','Morgens');


mittags1=uicontrol('style','text');
mittags2=uicontrol('style','text');
mittags3=uicontrol('style','text');
mittags4=uicontrol('style','text');
mittags5=uicontrol('style','text');

set(mittags1,'units','normalized','position', [0.05 0.55 0.1 0.05],'FontSize',16, 'string','Mittags');
set(mittags2,'units','normalized','position', [0.25 0.55 0.1 0.05],'FontSize',16, 'string','Mittags');
set(mittags3,'units','normalized','position', [0.45 0.55 0.1 0.05],'FontSize',16, 'string','Mittags');
set(mittags4,'units','normalized','position', [0.65 0.55 0.1 0.05],'FontSize',16, 'string','Mittags');
set(mittags5,'units','normalized','position', [0.85 0.55 0.1 0.05],'FontSize',16, 'string','Mittags');

abends1=uicontrol('style','text');
abends2=uicontrol('style','text');
abends3=uicontrol('style','text');
abends4=uicontrol('style','text');
abends5=uicontrol('style','text');

set(abends1,'units','normalized','position', [0.05 0.3 0.1 0.05],'FontSize',16, 'string','Abends');
set(abends2,'units','normalized','position', [0.25 0.3 0.1 0.05],'FontSize',16, 'string','Abends');
set(abends3,'units','normalized','position', [0.45 0.3 0.1 0.05],'FontSize',16, 'string','Abends');
set(abends4,'units','normalized','position', [0.65 0.3 0.1 0.05],'FontSize',16, 'string','Abends');
set(abends5,'units','normalized','position', [0.85 0.3 0.1 0.05],'FontSize',16, 'string','Abends');



axis off
axes('Position', [0.1 0.6 0.05 0.1])
if t==2
image(thermometer7)
end
if t==5
image(thermometer6)
end
axis image
axis off

axes('Position', [0.5 0.3 0.1 0.2])
image(thermometer3)
axis image
axis off





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