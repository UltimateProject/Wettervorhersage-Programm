function [ geschw_Tag_aktuell, geschw_Tage_rest, staerke_aktuell, staerke_Tage_rest ] = get_windSpeed(daten)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here


datum_system=cell(1);
datum_system{1,1}=date;
datum_system(1,1) = cellfun(@(x) x(1:2), datum_system(1,1), 'UniformOutput', false);

datum_vergleich=cell(1);


ordner_windgeschw = cell(1,3);

zaehler = 1;

laenge_structs=length(daten.children{1, 1}.children{1, 2}.children);

for kk = 1 : laenge_structs
               
    if strcmp(daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 1}.name,'temperature');
   
    	ordner_windgeschw{zaehler,1} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.attributes.from); 
        ordner_windgeschw{zaehler,2} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 3}.attributes.mps);
        ordner_windgeschw{zaehler,3} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 3}.attributes.beaufort);
        ordner_windgeschw(zaehler,4) = cellfun(@(x) x(12:13), ordner_windgeschw(zaehler,1), 'UniformOutput', false);
        ordner_windgeschw(zaehler,1) = cellfun(@(x) x(1:10), ordner_windgeschw(zaehler,1), 'UniformOutput', false);
        zaehler = zaehler + 1;
    end

end

for ff = 1 : length(ordner_windgeschw)
        %Splitten des Datums
        datum_teile = strsplit(char(ordner_windgeschw{ff,1}),'-');
        %Neu zusammensetzen in der deutschen schreibweise
        ordner_windgeschw{ff,1} = strjoin({datum_teile{3}, datum_teile{2}, datum_teile{1}},'.');
end


geschwindigkeiten_tage=cell(1);


for gg = 1 : 3 : 30
        
    counter=2;
    
    geschwindigkeiten_tage{1,gg}=ordner_windgeschw{1,1};
           
 
        for tt = 1 : length(ordner_windgeschw)
            
            %�bertragen des Vergleichsdatum des aktuellen Tages
            datum_vergleich{1,1}=geschwindigkeiten_tage{1,gg};
            % transformation des Datums zum Vergleich
            datum_vergleich(1,1) = cellfun(@(x) x(1:2), datum_vergleich(1,1), 'UniformOutput', false);

            
            if ordner_windgeschw{tt, 1} == ordner_windgeschw{1,1};
                % Speichern der Stunden in den entsprechenden Zeilen f�r
                % den aktuellen Tag
                if datum_system{1,1}==datum_vergleich{1,1}
                
                zeile=str2double(ordner_windgeschw(tt,4));
                geschwindigkeiten_tage{zeile+1,gg+1} = str2double(ordner_windgeschw{tt,2});
                geschwindigkeiten_tage{zeile+1,gg+2} = str2double(ordner_windgeschw{tt,3});
                counter=counter+1;
                
                else
                % Speichern der Stunden f�r die restlichen Tage
                geschwindigkeiten_tage{counter,gg+1} = str2double(ordner_windgeschw{tt,2});
                geschwindigkeiten_tage{zeile+1,gg+2} = str2double(ordner_windgeschw{tt,3});
                counter=counter+1;
                end
            
            end
        end
            
        for rr = 1 : length(ordner_windgeschw)
            
                if strcmp(ordner_windgeschw{1,1}, geschwindigkeiten_tage{1,gg});

                ordner_windgeschw(1,:)=[];
                end
        end
        
end


T=clock;

geschwindigkeiten_aktuell=geschwindigkeiten_tage(:,2);

geschw_Tag_aktuell(1,1)=[geschwindigkeiten_aktuell{T(1,4)+1,1}];
geschw_Tag_aktuell(2,1)=min([geschwindigkeiten_aktuell{:}]);
geschw_Tag_aktuell(3,1)=max([geschwindigkeiten_aktuell{:}]);


geschwindigkeiten_tag2 = geschwindigkeiten_tage(:,5);
geschw_Tage_rest(1,1)=min([geschwindigkeiten_tag2{:}]);
geschw_Tage_rest(2,1)=max([geschwindigkeiten_tag2{:}]);

geschwindigkeiten_tag3 = geschwindigkeiten_tage(:,8);
geschw_Tage_rest(1,2)=min([geschwindigkeiten_tag3{:}]);
geschw_Tage_rest(2,2)=max([geschwindigkeiten_tag3{:}]);

geschwindigkeiten_tag4 = geschwindigkeiten_tage(:,11);
geschw_Tage_rest(1,3)=min([geschwindigkeiten_tag4{:}]);
geschw_Tage_rest(2,3)=max([geschwindigkeiten_tag4{:}]);

geschwindigkeiten_tag5 = geschwindigkeiten_tage(:,14);
geschw_Tage_rest(1,4)=min([geschwindigkeiten_tag5{:}]);
geschw_Tage_rest(2,4)=max([geschwindigkeiten_tag5{:}]);

% Hier das gleiche nochmal f�r die Windst�rke

windstaerke_aktuell=geschwindigkeiten_tage(:,3);

staerke_aktuell(1,1)=[windstaerke_aktuell{T(1,4)+1,1}];
staerke_aktuell(2,1)=min([windstaerke_aktuell{:}]);
staerke_aktuell(3,1)=max([windstaerke_aktuell{:}]);


windstaerke_tag2 = geschwindigkeiten_tage(:,6);
staerke_Tage_rest(1,1)=min([windstaerke_tag2{:}]);
staerke_Tage_rest(2,1)=max([windstaerke_tag2{:}]);

windstaerke_tag3 = geschwindigkeiten_tage(:,9);
staerke_Tage_rest(1,2)=min([windstaerke_tag3{:}]);
staerke_Tage_rest(2,2)=max([windstaerke_tag3{:}]);

windstaerke_tag4 = geschwindigkeiten_tage(:,12);
staerke_Tage_rest(1,3)=min([windstaerke_tag4{:}]);
staerke_Tage_rest(2,3)=max([windstaerke_tag4{:}]);

windstaerke_tag5 = geschwindigkeiten_tage(:,15);
staerke_Tage_rest(1,4)=min([windstaerke_tag5{:}]);
staerke_Tage_rest(2,4)=max([windstaerke_tag5{:}]);


end


