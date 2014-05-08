function [ Tag_aktuell, Tage_rest, datum] = get_temp(daten,datum_system)
% Diese Funktion filtert die Temperaturen des aktuellen Tages und die der 
% darauffolgenden 4 Tage aus den heruntergeladenen Informationen.  


datum_vergleich=cell(1); % Erstellt ein Cell-Array für das Vergleichsdatum. 


ordner_temperatur=cell(1,3); % Erstellt ein Cell-Array für die Temperaturen.

% Ermittelt die Länge der zu durchsuchenden Daten.
laenge_structs=length(daten.children{1, 1}.children{1, 2}.children);

zaehler = 1; % Deklaration einer Laufvariable.

% Beginn der "Filter"-Schleife. Diese Schleife filtert die Temperaturen aus
% den gesamten Wetterinformationen.
for kk = 1 : laenge_structs  
   
    % Überprüfung durch If-Abfrage. Diese Abfrage überprüft ob das Wort
    % "temperature" in den einzelnen Pfaden vorhanden sind. 
    if strcmp(daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 1}.name,'temperature');
        
        % Übergibt Datum mit Uhrzeit in den Cell-Array
    	ordner_temperatur{zaehler,1} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.attributes.from); 
        % Übergibt den Wert der Temperatur in den Cell-Array
        ordner_temperatur{zaehler,2} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 1}.attributes.value);
        % Übergibt die jeweilige Stunde in den Cell-Array.
        ordner_temperatur(zaehler,3) = cellfun(@(x) x(12:13), ordner_temperatur(zaehler,1), 'UniformOutput', false);
        % Speichert nur das Datum wieder im Cell-Array.   
        ordner_temperatur(zaehler,1) = cellfun(@(x) x(1:10), ordner_temperatur(zaehler,1), 'UniformOutput', false);
        
        zaehler = zaehler + 1; % Erhöht die Laufvariable um 1.
    
    end % Ende der If-Abfrage.

end % Ende der Schleife.

% Schleife zur Änderung der Schreibweise des Datums.
for ff = 1 : length(ordner_temperatur) 
       
        % Splitten des Datums in die drei Bestandteile.
        datum_teile = strsplit(char(ordner_temperatur{ff,1}),'-');
        % Zusammensetzen der Bestandteile in der deutschen Schreibweise.
        ordner_temperatur{ff,1} = strjoin({datum_teile{3}, datum_teile{2}, datum_teile{1}},'.');

end % Ende der Schleife.

temperatur_tage=cell(1); % Erstellt ein Cell-Array für die Temperaturen.

% Äußere for-Schleife zur Umstrukturierung der erittelten Temperaturen.
for gg = 1 : 2 : 20
        
    counter=2; % Deklaration einer Laufvariable 
    
    % Überträgt bei jedem Durchlauf das Datum eines neuen Tages. 
    temperatur_tage{1,gg}=ordner_temperatur{1,1}; 
           
        % Innere for-Schleife zur Umstrukturierung der erittelten Temperaturen.
        for tt = 1 : length(ordner_temperatur) 
            
            % Übertragen des Datums des für den Durchlauf aktuellen Tages.
            datum_vergleich{1,1}=temperatur_tage{1,gg};
            % Transformation des Datums zum Vergleich.
            datum_vergleich(1,1) = cellfun(@(x) x(1:2), datum_vergleich(1,1), 'UniformOutput', false);

            % Abfrage zur Überprüfung. Überprüft ob es sich um das gleiche
            % Datum handelt.
            if ordner_temperatur{tt, 1} == ordner_temperatur{1,1};
                
                % Überprüft ob es sich um das gleiche Datum wie beim System
                % handelt.
                if datum_system{1,1}==datum_vergleich{1,1}
                
                % Wandelt den Wert der Stunde für die Zuweisung in double-Format um.    
                zeile=str2double(ordner_temperatur(tt,3));
                % Speichern der Temperaturen des aktuellen Tages.
                temperatur_tage{zeile+1,gg+1} = str2double(ordner_temperatur{tt,2});
                counter=counter+1; % Erhöht den counter um 1.
                
                else % Zweig für die restlichen 4 Tage.
                    
                % Speichern der Temperaturen für die restlichen Tage.
                temperatur_tage{counter,gg+1} = str2double(ordner_temperatur{tt,2});
                counter=counter+1; % Erhöht den counter um 1.
                
                end % Ende der inneren Abfrage.
            
            end % Ende der äußeren Abfrage.
        
        end % Ende der inneren Schleife. 
        
        % Schleife zum Löschen der bereits verarbeiteten Tage.
        for rr = 1 : length(ordner_temperatur)
            
                % Kontrollabfrage des Datums.
                if strcmp(ordner_temperatur{1,1}, temperatur_tage{1,gg});
                
                % Löschen der einzelnen Zeilen.
                ordner_temperatur(1,:)=[];
                
                end % Ende der Abfrage
        
        end % Ende der Löschschleife. 
        
end % Ende der äußeren Schleife.

datum(1,1)=temperatur_tage(1,1)
datum(2,1)=temperatur_tage(1,3)
datum(3,1)=temperatur_tage(1,5)
datum(4,1)=temperatur_tage(1,7)
datum(5,1)=temperatur_tage(1,9)

T=clock; % Ermitteln der Systemzeit.

% Übertragen der einzelnen Temperaturen des aktuellen Tages.
temperaturen_aktuell=temperatur_tage(:,2); 

Tag_aktuell(1,1)=[temperaturen_aktuell{T(1,4)+1,1}]; % Ermitteln der aktuellen Temperatur.
Tag_aktuell(2,1)=min([temperaturen_aktuell{:}]); % Ermitteln der niedrigsten Temperatur.
Tag_aktuell(3,1)=max([temperaturen_aktuell{:}]); % Ermitteln der maximalen Temperatur.

% Übertragen der einzelnen Temperaturen des zweiten Tages.
temperaturen_tag2 = temperatur_tage(:,4); 
Tage_rest(1,1)=min([temperaturen_tag2{:}]); % Ermitteln der niedrigsten Temperatur.
Tage_rest(2,1)=max([temperaturen_tag2{:}]); % Ermitteln der maximalen Temperatur.

% Übertragen der einzelnen Temperaturen des dritten Tages.
temperaturen_tag3 = temperatur_tage(:,6);
Tage_rest(1,2)=min([temperaturen_tag3{:}]); % Ermitteln der niedrigsten Temperatur.
Tage_rest(2,2)=max([temperaturen_tag3{:}]); % Ermitteln der maximalen Temperatur.

% Übertragen der einzelnen Temperaturen des vierten Tages.
temperaturen_tag4 = temperatur_tage(:,8);
Tage_rest(1,3)=min([temperaturen_tag4{:}]); % Ermitteln der niedrigsten Temperatur.
Tage_rest(2,3)=max([temperaturen_tag4{:}]); % Ermitteln der maximalen Temperatur.

% Übertragen der einzelnen Temperaturen des fünften Tages.
temperaturen_tag5 = temperatur_tage(:,10);
Tage_rest(1,4)=min([temperaturen_tag5{:}]); % Ermitteln der niedrigsten Temperatur.
Tage_rest(2,4)=max([temperaturen_tag5{:}]); % Ermitteln der maximalen Temperatur.

end % Ende der Funktion

%--------------------Licence ---------------------------------------------
% Copyright (c) <2014> Marc Hieronimus, Joseffa Baumann
