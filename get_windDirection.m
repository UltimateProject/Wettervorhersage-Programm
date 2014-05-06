function [ ordner_windrichtung ] = get_windDirection(daten)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

ordner_windrichtung=cell(2,3);

zaehler = 1;

laenge_structs=length(daten.children{1, 1}.children{1, 2}.children);

for pp = 1 : laenge_structs

    if strcmp(daten.children{1, 1}.children{1, 2}.children{1, pp}.children{1, 1}.children{1, 2}.name,'windDirection');
    
    	ordner_windrichtung{zaehler,1} = (daten.children{1, 1}.children{1, 2}.children{1, pp}.attributes.from); 
        ordner_windrichtung{zaehler,2} = (daten.children{1, 1}.children{1, 2}.children{1, pp}.children{1, 1}.children{1, 2}.attributes.deg);
        ordner_windrichtung{zaehler,3} = (daten.children{1, 1}.children{1, 2}.children{1, pp}.children{1, 1}.children{1, 2}.attributes.name);
        ordner_windrichtung(zaehler,1) = cellfun(@(x) x(1:10), ordner_windrichtung(zaehler,1), 'UniformOutput', false);
        zaehler = zaehler + 1;
    end

end

end




