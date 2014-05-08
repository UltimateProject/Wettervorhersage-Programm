function [ richtung_Tag_aktuell,richtung_Tage_rest ] = get_windDirection(daten,datum_system)
% Diese Funktion filtert die Windrichtungen des aktuellen Tages und die der 
% darauffolgenden 4 Tage aus den heruntergeladenen Informationen. 

datum_vergleich=cell(1); % Erstellt ein Cell-Array für das Vergleichsdatum. 


ordner_windrichtung=cell(2,3); % Erstellt ein Cell-Array für die Windrichtungen.

zaehler = 1; % Deklaration einer Laufvariable.

% Ermittelt die Länge der zu durchsuchenden Daten.
laenge_structs=length(daten.children{1, 1}.children{1, 2}.children);

% Beginn der "Filter"-Schleife. Diese Schleife filtert die Windrichtungen aus
% den gesamten Wetterinformationen.
for pp = 1 : laenge_structs

    % Überprüfung durch If-Abfrage. Diese Abfrage überprüft ob das Wort
    % "windDirection" in den einzelnen Pfaden vorhanden sind. 
    if strcmp(daten.children{1, 1}.children{1, 2}.children{1, pp}.children{1, 1}.children{1, 2}.name,'windDirection');
    
    	% Übergibt Datum mit Uhrzeit in den Cell-Array
        ordner_windrichtung{zaehler,1} = (daten.children{1, 1}.children{1, 2}.children{1, pp}.attributes.from); 
        % Übergibt die Gradzahl der Windrichtung in den Cell-Array
        ordner_windrichtung{zaehler,2} = (daten.children{1, 1}.children{1, 2}.children{1, pp}.children{1, 1}.children{1, 2}.attributes.deg);
        % Übergibt die Himmelsrichtung der Windrichtung in den Cell-Array
        ordner_windrichtung{zaehler,3} = (daten.children{1, 1}.children{1, 2}.children{1, pp}.children{1, 1}.children{1, 2}.attributes.name);
        % Übergibt die jeweilige Stunde in den Cell-Array.
        ordner_windrichtung(zaehler,4) = cellfun(@(x) x(12:13), ordner_windrichtung(zaehler,1), 'UniformOutput', false);
        % Speichert nur das Datum wieder im Cell-Array. 
        ordner_windrichtung(zaehler,1) = cellfun(@(x) x(1:10), ordner_windrichtung(zaehler,1), 'UniformOutput', false);
        
        zaehler = zaehler + 1; % Erhöht die Laufvariable um 1.
    
    end % Ende der If-Abfrage.

end % Ende der Schleife.

% Schleife zur Änderung der Schreibweise des Datums.
for ff = 1 : length(ordner_windrichtung)
        
        % Splitten des Datums in die drei Bestandteile.
        datum_teile = strsplit(char(ordner_windrichtung{ff,1}),'-');
        % Zusammensetzen der Bestandteile in der deutschen Schreibweise.
        ordner_windrichtung{ff,1} = strjoin({datum_teile{3}, datum_teile{2}, datum_teile{1}},'.');

end % Ende der Schleife.
 
 
richtungen_tage=cell(1); % Erstellt ein Cell-Array für die Windrichtungen.

% Äußere for-Schleife zur Umstrukturierung der erittelten Windrichtungen.
for oo = 1 : 3 : 30
        
    counter=2; % Deklaration einer Laufvariable 
    
    % Überträgt bei jedem Durchlauf das Datum eines neuen Tages. 
    richtungen_tage{1,oo}=ordner_windrichtung{1,1};
           
        % Innere for-Schleife zur Umstrukturierung der erittelten Windrichtungen.
        for qq = 1 : length(ordner_windrichtung)
            
            % Übertragen des Datums des für den Durchlauf aktuellen Tages.
            datum_vergleich{1,1}=richtungen_tage{1,oo};
            % Transformation des Datums zum Vergleich.
            datum_vergleich(1,1) = cellfun(@(x) x(1:2), datum_vergleich(1,1), 'UniformOutput', false);

            % Abfrage zur Überprüfung. Überprüft ob es sich um das gleiche
            % Datum handelt.
            if ordner_windrichtung{qq, 1} == ordner_windrichtung{1,1};
                
                % Überprüft ob es sich um das gleiche Datum wie beim System
                % handelt.
                if datum_system{1,1}==datum_vergleich{1,1}
                
                % Wandelt den Wert der Stunde für die Zuweisung in double-Format um.
                zeile=str2double(ordner_windrichtung(qq,4));
                % Speichern der Windrichtungen des aktuellen Tages.
                richtungen_tage{zeile+1,oo+1} = str2double(ordner_windrichtung{qq,2});
                % Speichern der Himmelsrichtungen des aktuellen Tages.
                richtungen_tage{zeile+1,oo+2} = (ordner_windrichtung{qq,3});
                counter=counter+1; % Erhöht den counter um 1.
                
                else % Zweig für die restlichen 4 Tage.
                    
                % Speichern der Windrichtungen für die restlichen Tage.
                richtungen_tage{counter,oo+1} = str2double(ordner_windrichtung{qq,2});
                % Speichern der Himmelsrichtungen für die restlichen Tage.
                richtungen_tage{zeile+1,oo+2} = (ordner_windrichtung{qq,3});
                counter=counter+1; % Erhöht den counter um 1.
                
                end % Ende der inneren Abfrage.
             
            end % Ende der äußeren Abfrage.
            
        end % Ende der inneren Schleife. 
            
        % Schleife zum Löschen der bereits verarbeiteten Tage.
        for rr = 1 : length(ordner_windrichtung)
            
            % Kontrollabfrage des Datums.    
            if strcmp(ordner_windrichtung{1,1}, richtungen_tage{1,oo});

                % Löschen der einzelnen Zeilen.
                ordner_windrichtung(1,:)=[];
            
            end % Ende der Abfrage
            
        end % Ende der Löschschleife. 

end % Ende der äußeren Schleife.

T=clock; % Ermitteln der Systemzeit.

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

