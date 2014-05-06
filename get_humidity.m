function [ feuchtigkeit_Tag_aktuell, feuchtigkeit_Tage_rest ] = get_humidity( daten,datum_system )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

datum_vergleich=cell(1);


ordner_feuchte=cell(1,3);

laenge_structs=length(daten.children{1, 1}.children{1, 2}.children);

zaehler = 1;

for kk = 1 : laenge_structs

    if strcmp(daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 4}.name,'humidity');
    
    	ordner_feuchte{zaehler,1} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.attributes.from); 
        ordner_feuchte{zaehler,2} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 4}.attributes.value);
        ordner_feuchte(zaehler,3) = cellfun(@(x) x(12:13), ordner_feuchte(zaehler,1), 'UniformOutput', false);
        ordner_feuchte(zaehler,1) = cellfun(@(x) x(1:10), ordner_feuchte(zaehler,1), 'UniformOutput', false);
        zaehler = zaehler + 1;
    end

end


for ff = 1 : length(ordner_feuchte)
        %Splitten des Datums
        datum_teile = strsplit(char(ordner_feuchte{ff,1}),'-');
        %Neu zusammensetzen in der deutschen schreibweise
        ordner_feuchte{ff,1} = strjoin({datum_teile{3}, datum_teile{2}, datum_teile{1}},'.');
end

feuchtigkeit_tage=cell(1);


for gg = 1 : 2 : 20
        
    counter=2;
    
    feuchtigkeit_tage{1,gg}=ordner_feuchte{1,1};
           
 
        for tt = 1 : length(ordner_feuchte)
            
            %übertragen des Vergleichsdatum des aktuellen Tages
            datum_vergleich{1,1}=feuchtigkeit_tage{1,gg};
            % transformation des Datums zum Vergleich
            datum_vergleich(1,1) = cellfun(@(x) x(1:2), datum_vergleich(1,1), 'UniformOutput', false);

            
            if ordner_feuchte{tt, 1} == ordner_feuchte{1,1};
                % Speichern der Stunden in den entsprechenden Zeilen für
                % den aktuellen Tag
                if datum_system{1,1}==datum_vergleich{1,1}
                
                zeile=str2double(ordner_feuchte(tt,3));
                feuchtigkeit_tage{zeile+1,gg+1} = str2double(ordner_feuchte{tt,2});
                counter=counter+1;
                
                else
                % Speichern der Stunden für die restlichen Tage
                feuchtigkeit_tage{counter,gg+1} = str2double(ordner_feuchte{tt,2});
                counter=counter+1;
                end
            
            end
        end
            
        for rr = 1 : length(ordner_feuchte)
            
                if strcmp(ordner_feuchte{1,1}, feuchtigkeit_tage{1,gg});

                ordner_feuchte(1,:)=[];
                end
        end
        
end

T=clock;

feuchtigkeit_aktuell=feuchtigkeit_tage(:,2);

feuchtigkeit_Tag_aktuell(1,1)=[feuchtigkeit_aktuell{T(1,4)+1,1}];
feuchtigkeit_Tag_aktuell(2,1)=min([feuchtigkeit_aktuell{:}]);
feuchtigkeit_Tag_aktuell(3,1)=max([feuchtigkeit_aktuell{:}]);


feuchtigkeit_tag2 = feuchtigkeit_tage(:,4);
feuchtigkeit_Tage_rest(1,1)=min([feuchtigkeit_tag2{:}]);
feuchtigkeit_Tage_rest(2,1)=max([feuchtigkeit_tag2{:}]);

feuchtigkeit_tag3 = feuchtigkeit_tage(:,6);
feuchtigkeit_Tage_rest(1,2)=min([feuchtigkeit_tag3{:}]);
feuchtigkeit_Tage_rest(2,2)=max([feuchtigkeit_tag3{:}]);

feuchtigkeit_tag4 = feuchtigkeit_tage(:,8);
feuchtigkeit_Tage_rest(1,3)=min([feuchtigkeit_tag4{:}]);
feuchtigkeit_Tage_rest(2,3)=max([feuchtigkeit_tag4{:}]);

feuchtigkeit_tag5 = feuchtigkeit_tage(:,10);
feuchtigkeit_Tage_rest(1,4)=min([feuchtigkeit_tag5{:}]);
feuchtigkeit_Tage_rest(2,4)=max([feuchtigkeit_tag5{:}]);

