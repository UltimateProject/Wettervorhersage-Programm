function [ Tag_aktuell, Tage_rest] = get_temp(daten)
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

T=clock;

temperaturen_aktuell=temperatur_tage(:,2);

Tag_aktuell(1,1)=[temperaturen_aktuell{T(1,4)+1,1}];
Tag_aktuell(2,1)=min([temperaturen_aktuell{:}]);
Tag_aktuell(3,1)=max([temperaturen_aktuell{:}]);


temperaturen_tag2 = temperatur_tage(:,4);
Tage_rest(1,1)=min([temperaturen_tag2{:}]);
Tage_rest(2,1)=max([temperaturen_tag2{:}]);

temperaturen_tag3 = temperatur_tage(:,6);
Tage_rest(1,2)=min([temperaturen_tag3{:}]);
Tage_rest(2,2)=max([temperaturen_tag3{:}]);

temperaturen_tag4 = temperatur_tage(:,8);
Tage_rest(1,3)=min([temperaturen_tag4{:}]);
Tage_rest(2,3)=max([temperaturen_tag4{:}]);

temperaturen_tag5 = temperatur_tage(:,10);
Tage_rest(1,4)=min([temperaturen_tag5{:}]);
Tage_rest(2,4)=max([temperaturen_tag5{:}]);




