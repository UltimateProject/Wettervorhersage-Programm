function [ ordner_bewoelkung ] = get_cloudiness(daten)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

ordner_bewoelkung=cell(1,2);

laenge_structs=length(daten.children{1, 1}.children{1, 2}.children);

zaehler = 1;

for kk = 1 : laenge_structs

    if strcmp(daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 1}.name,'temperature');
    
    	ordner_bewoelkung{zaehler,1} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.attributes.from); 
        ordner_bewoelkung{zaehler,2} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 6}.attributes.percent);
        ordner_bewoelkung(zaehler,1) = cellfun(@(x) x(1:10), ordner_bewoelkung(zaehler,1), 'UniformOutput', false);
        zaehler = zaehler + 1;
    end

end

end

