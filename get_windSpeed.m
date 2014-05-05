function [ ordner_windgeschw ] = get_windSpeed(daten)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

ordner_windgeschw = cell(1,3);

zaehler = 1;

laenge_structs=length(daten.children{1, 1}.children{1, 2}.children);

for kk = 1 : laenge_structs
               
    if strcmp(daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 1}.name,'temperature');
   
    	ordner_windgeschw{zaehler,1} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.attributes.from); 
        ordner_windgeschw{zaehler,2} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 3}.attributes.mps);
        ordner_windgeschw{zaehler,3} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 3}.attributes.beaufort);
        ordner_windgeschw(zaehler,1) = cellfun(@(x) x(1:10), ordner_windgeschw(zaehler,1), 'UniformOutput', false);
        zaehler = zaehler + 1;
    end

end



end

