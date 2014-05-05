function [ ordner_temperatur, temperatur_tage] = get_temp(daten)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

datum_system=cell(1);
datum_system{1,1}=date;
datum_system(1,1) = cellfun(@(x) x(1:2), datum_system(1,1), 'UniformOutput', false);

datum_vergleich=cell(1);


ordner_temperatur=cell(1,3);

laenge_structs=length(daten.children{1, 1}.children{1, 2}.children);

zaehler = 1;

for kk = 1 : laenge_structs

    if strcmp(daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 1}.name,'temperature');
    
    	ordner_temperatur{zaehler,1} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.attributes.from); 
        ordner_temperatur{zaehler,2} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 1}.attributes.value);
        ordner_temperatur(zaehler,3) = cellfun(@(x) x(12:13), ordner_temperatur(zaehler,1), 'UniformOutput', false);
        ordner_temperatur(zaehler,1) = cellfun(@(x) x(1:10), ordner_temperatur(zaehler,1), 'UniformOutput', false);
        zaehler = zaehler + 1;
    end

end


for ff = 1 : length(ordner_temperatur)
        %Splitten des Datums
        datum_teile = strsplit(char(ordner_temperatur{ff,1}),'-');
        %Neu zusammensetzen in der deutschen schreibweise
        ordner_temperatur{ff,1} = strjoin({datum_teile{3}, datum_teile{2}, datum_teile{1}},'.');
end

temperatur_tage=cell(1);


for gg = 1 : 2 : 20
        
    counter=2;
    
    temperatur_tage{1,gg}=ordner_temperatur{1,1};
           
 
        for tt = 1 : length(ordner_temperatur)
            
            %übertragen des Vergleichsdatum des aktuellen Tages
            datum_vergleich{1,1}=temperatur_tage{1,gg};
            % transformation des Datums zum Vergleich
            datum_vergleich(1,1) = cellfun(@(x) x(1:2), datum_vergleich(1,1), 'UniformOutput', false);

            
            if ordner_temperatur{tt, 1} == ordner_temperatur{1,1};
                % Speichern der Stunden in den entsprechenden Zeilen für
                % den aktuellen Tag
                if datum_system{1,1}==datum_vergleich{1,1}
                
                zeile=str2double(ordner_temperatur(tt,3));
                temperatur_tage{zeile+1,gg+1} = str2double(ordner_temperatur{tt,2});
                counter=counter+1;
                
                else
                % Speichern der Stunden für die restlichen Tage
                temperatur_tage{counter,gg+1} = str2double(ordner_temperatur{tt,2});
                counter=counter+1;
                end
            
            end
        end
            
        for rr = 1 : length(ordner_temperatur)
            
                if strcmp(ordner_temperatur{1,1}, temperatur_tage{1,gg});

                ordner_temperatur(1,:)=[];
                end
        end
        
end
  
temperaturen=cell(1);
temperaturen=temperatur_tage{:,1:2};


% for mm = 1 : 2 : 18
% 
% %         temperaturen{1,mm+2}=temperatur_tage{1,mm+2};
%         temperaturen(1,mm+3)= min(cell2mat(temperatur_tage(:,mm+3)));
% %         temperaturen{2,mm+3}=max(temperatur_tage{:,mm+3});
% 
% 
% end

