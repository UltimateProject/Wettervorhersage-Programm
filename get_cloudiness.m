function [ wolken_dichte_Tage_rest, wolken_dichte_aktuell ] = get_cloudiness(daten)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

datum_system=cell(1);
datum_system{1,1}=date;
datum_system(1,1) = cellfun(@(x) x(1:2), datum_system(1,1), 'UniformOutput', false);

datum_vergleich=cell(1);

ordner_bewoelkung=cell(1,2);

laenge_structs=length(daten.children{1, 1}.children{1, 2}.children);

zaehler = 1;

for kk = 1 : laenge_structs

    if strcmp(daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 1}.name,'temperature');
    
    	ordner_bewoelkung{zaehler,1} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.attributes.from); 
        ordner_bewoelkung{zaehler,2} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 6}.attributes.percent);
        ordner_bewoelkung(zaehler,3) = cellfun(@(x) x(12:13), ordner_bewoelkung(zaehler,1), 'UniformOutput', false);
        ordner_bewoelkung(zaehler,1) = cellfun(@(x) x(1:10), ordner_bewoelkung(zaehler,1), 'UniformOutput', false);
        zaehler = zaehler + 1;
    end

end

for ff = 1 : length(ordner_bewoelkung)
        %Splitten des Datums
        datum_teile = strsplit(char(ordner_bewoelkung{ff,1}),'-');
        %Neu zusammensetzen in der deutschen schreibweise
        ordner_bewoelkung{ff,1} = strjoin({datum_teile{3}, datum_teile{2}, datum_teile{1}},'.');
end

bewoelkung_tage=cell(1);


for gg = 1 : 2 : 20
        
    counter=2;
    
    bewoelkung_tage{1,gg}=ordner_bewoelkung{1,1};
           
 
        for tt = 1 : length(ordner_bewoelkung)
            
            %übertragen des Vergleichsdatum des aktuellen Tages
            datum_vergleich{1,1}=bewoelkung_tage{1,gg};
            % transformation des Datums zum Vergleich
            datum_vergleich(1,1) = cellfun(@(x) x(1:2), datum_vergleich(1,1), 'UniformOutput', false);

            
            if ordner_bewoelkung{tt, 1} == ordner_bewoelkung{1,1};
                % Speichern der Stunden in den entsprechenden Zeilen für
                % den aktuellen Tag
                if datum_system{1,1}==datum_vergleich{1,1}
                
                zeile=str2double(ordner_bewoelkung(tt,3));
                bewoelkung_tage{zeile+1,gg+1} = str2double(ordner_bewoelkung{tt,2});
                counter=counter+1;
                
                else
                % Speichern der Stunden für die restlichen Tage
                bewoelkung_tage{counter,gg+1} = str2double(ordner_bewoelkung{tt,2});
                counter=counter+1;
                end
            
            end
        end
            
        for rr = 1 : length(ordner_bewoelkung)
            
                if strcmp(ordner_bewoelkung{1,1}, bewoelkung_tage{1,gg});

                ordner_bewoelkung(1,:)=[];
                end
        end
        
end

T=clock;

bewoelkung_aktuell=bewoelkung_tage(:,2);

wolken_dichte_aktuell(1,1)=[bewoelkung_aktuell{T(1,4)+1,1}];
wolken_dichte_aktuell(2,1)=min([bewoelkung_aktuell{:}]);
wolken_dichte_aktuell(3,1)=max([bewoelkung_aktuell{:}]);


bewoelkung_tag2 = bewoelkung_tage(:,4);
wolken_dichte_Tage_rest(1,1)=min([bewoelkung_tag2{:}]);
wolken_dichte_Tage_rest(2,1)=max([bewoelkung_tag2{:}]);

bewoelkung_tag3 = bewoelkung_tage(:,6);
wolken_dichte_Tage_rest(1,2)=min([bewoelkung_tag3{:}]);
wolken_dichte_Tage_rest(2,2)=max([bewoelkung_tag3{:}]);

bewoelkung_tag4 = bewoelkung_tage(:,8);
wolken_dichte_Tage_rest(1,3)=min([bewoelkung_tag4{:}]);
wolken_dichte_Tage_rest(2,3)=max([bewoelkung_tag4{:}]);

bewoelkung_tag5 = bewoelkung_tage(:,10);
wolken_dichte_Tage_rest(1,4)=min([bewoelkung_tag5{:}]);
wolken_dichte_Tage_rest(2,4)=max([bewoelkung_tag5{:}]);



end

