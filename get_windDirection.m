function [ richtung_Tag_aktuell,richtung_Tage_rest ] = get_windDirection(daten,datum_system)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

datum_vergleich=cell(1);


ordner_windrichtung=cell(2,3);

zaehler = 1;

laenge_structs=length(daten.children{1, 1}.children{1, 2}.children);

for pp = 1 : laenge_structs

    if strcmp(daten.children{1, 1}.children{1, 2}.children{1, pp}.children{1, 1}.children{1, 2}.name,'windDirection');
    
    	ordner_windrichtung{zaehler,1} = (daten.children{1, 1}.children{1, 2}.children{1, pp}.attributes.from); 
        ordner_windrichtung{zaehler,2} = (daten.children{1, 1}.children{1, 2}.children{1, pp}.children{1, 1}.children{1, 2}.attributes.deg);
        ordner_windrichtung{zaehler,3} = (daten.children{1, 1}.children{1, 2}.children{1, pp}.children{1, 1}.children{1, 2}.attributes.name);
        ordner_windrichtung(zaehler,4) = cellfun(@(x) x(12:13), ordner_windrichtung(zaehler,1), 'UniformOutput', false);
        ordner_windrichtung(zaehler,1) = cellfun(@(x) x(1:10), ordner_windrichtung(zaehler,1), 'UniformOutput', false);
        zaehler = zaehler + 1;
    end

end

for ff = 1 : length(ordner_windrichtung)
        %Splitten des Datums
        datum_teile = strsplit(char(ordner_windrichtung{ff,1}),'-');
        %Neu zusammensetzen in der deutschen schreibweise
        ordner_windrichtung{ff,1} = strjoin({datum_teile{3}, datum_teile{2}, datum_teile{1}},'.');
end
% 
% 
richtungen_tage=cell(1);


for oo = 1 : 3 : 30
        
    counter=2;
    
    richtungen_tage{1,oo}=ordner_windrichtung{1,1};
           
 
        for qq = 1 : length(ordner_windrichtung)
            
            %�bertragen des Vergleichsdatum des aktuellen Tages
            datum_vergleich{1,1}=richtungen_tage{1,oo};
            % transformation des Datums zum Vergleich
            datum_vergleich(1,1) = cellfun(@(x) x(1:2), datum_vergleich(1,1), 'UniformOutput', false);

            
            if ordner_windrichtung{qq, 1} == ordner_windrichtung{1,1};
                % Speichern der Stunden in den entsprechenden Zeilen f�r
                % den aktuellen Tag
                if datum_system{1,1}==datum_vergleich{1,1}
                
                zeile=str2double(ordner_windrichtung(qq,4));
                richtungen_tage{zeile+1,oo+1} = str2double(ordner_windrichtung{qq,2});
                richtungen_tage{zeile+1,oo+2} = (ordner_windrichtung{qq,3});
                counter=counter+1;
                
                else
                % Speichern der Stunden f�r die restlichen Tage
                richtungen_tage{counter,oo+1} = str2double(ordner_windrichtung{qq,2});
                richtungen_tage{zeile+1,oo+2} = (ordner_windrichtung{qq,3});
                counter=counter+1;
                end
            
            end
        end
            
        for rr = 1 : length(ordner_windrichtung)
            
                if strcmp(ordner_windrichtung{1,1}, richtungen_tage{1,oo});

                ordner_windrichtung(1,:)=[];
                end
        end

end

T=clock;

richtung_aktuell=richtungen_tage(:,2);

richtung_Tag_aktuell(1,1)=[richtung_aktuell{T(1,4)+1,1}];
richtung_Tag_aktuell(2,1)=min([richtung_aktuell{:}]);
richtung_Tag_aktuell(3,1)=max([richtung_aktuell{:}]);


richtung_tag2 = richtungen_tage(:,5);
richtung_Tage_rest(1,1)=min([richtung_tag2{:}]);
richtung_Tage_rest(2,1)=max([richtung_tag2{:}]);

richtung_tag3 = richtungen_tage(:,8);
richtung_Tage_rest(1,2)=min([richtung_tag3{:}]);
richtung_Tage_rest(2,2)=max([richtung_tag3{:}]);

richtung_tag4 = richtungen_tage(:,11);
richtung_Tage_rest(1,3)=min([richtung_tag4{:}]);
richtung_Tage_rest(2,3)=max([richtung_tag4{:}]);

richtung_tag5 = richtungen_tage(:,14);
richtung_Tage_rest(1,4)=min([richtung_tag5{:}]);
richtung_Tage_rest(2,4)=max([richtung_tag5{:}]);

end

