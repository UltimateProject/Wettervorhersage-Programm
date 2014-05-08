function [ wolken_dichte_Tage_rest, wolken_dichte_aktuell ] = get_cloudiness(daten,datum_system)
% Diese Funktion filtert die prozentuale Bewölkungen des aktuellen Tages und
% die der darauffolgenden 4 Tage aus den heruntergeladenen Informationen. 


datum_vergleich=cell(1); % Erstellt ein Cell-Array für das Vergleichsdatum. 

ordner_bewoelkung=cell(1,2); % Erstellt ein Cell-Array für die Bewölkungen.

% Ermittelt die Länge der zu durchsuchenden Daten.
laenge_structs=length(daten.children{1, 1}.children{1, 2}.children);

zaehler = 1; % Deklaration einer Laufvariable.

% Beginn der "Filter"-Schleife. Diese Schleife filtert die prozenuale 
% Bewökungen aus den gesamten Wetterinformationen.
for kk = 1 : laenge_structs

    % Überprüfung durch If-Abfrage. Diese Abfrage überprüft ob das Wort
    % "temperature" in den einzelnen Pfaden vorhanden sind. 
    if strcmp(daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 1}.name,'temperature');
    
        % Übergibt Datum mit Uhrzeit in den Cell-Array
    	ordner_bewoelkung{zaehler,1} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.attributes.from); 
        % Übergibt den Wert der Bewölkung in den Cell-Array
        ordner_bewoelkung{zaehler,2} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 6}.attributes.percent);
        % Übergibt die jeweilige Stunde in den Cell-Array.
        ordner_bewoelkung(zaehler,3) = cellfun(@(x) x(12:13), ordner_bewoelkung(zaehler,1), 'UniformOutput', false);
        % Speichert nur das Datum wieder im Cell-Array.
        ordner_bewoelkung(zaehler,1) = cellfun(@(x) x(1:10), ordner_bewoelkung(zaehler,1), 'UniformOutput', false);
        
        zaehler = zaehler + 1; % Erhöht die Laufvariable um 1.
    
    end % Ende der If-Abfrage.

end % Ende der Schleife.

% Schleife zur Änderung der Schreibweise des Datums.
for ff = 1 : length(ordner_bewoelkung)
        
        % Splitten des Datums in die drei Bestandteile.
        datum_teile = strsplit(char(ordner_bewoelkung{ff,1}),'-');
        % Zusammensetzen der Bestandteile in der deutschen Schreibweise.
        ordner_bewoelkung{ff,1} = strjoin({datum_teile{3}, datum_teile{2}, datum_teile{1}},'.');

end % Ende der Schleife.

bewoelkung_tage=cell(1); % Erstellt ein Cell-Array für die Bewölkungen.

% Äußere for-Schleife zur Umstrukturierung der erittelten Bewölkungen.
for gg = 1 : 2 : 20
        
    counter=2; % Deklaration einer Laufvariable 
    
    % Überträgt bei jedem Durchlauf das Datum eines neuen Tages. 
    bewoelkung_tage{1,gg}=ordner_bewoelkung{1,1};
           
        % Innere for-Schleife zur Umstrukturierung der erittelten Bewölkungen.
        for tt = 1 : length(ordner_bewoelkung)
            
            % Übertragen des Datums des für den Durchlauf aktuellen Tages.
            datum_vergleich{1,1}=bewoelkung_tage{1,gg};
            % Transformation des Datums zum Vergleich.
            datum_vergleich(1,1) = cellfun(@(x) x(1:2), datum_vergleich(1,1), 'UniformOutput', false);

            % Abfrage zur Überprüfung. Überprüft ob es sich um das gleiche
            % Datum handelt.
            if ordner_bewoelkung{tt, 1} == ordner_bewoelkung{1,1};
                
                % Überprüft ob es sich um das gleiche Datum wie beim System
                % handelt.
                if datum_system{1,1}==datum_vergleich{1,1}
                
                % Wandelt den Wert der Stunde für die Zuweisung in double-Format um.    
                zeile=str2double(ordner_bewoelkung(tt,3));
                % Speichern der Bewölkungen des aktuellen Tages.
                bewoelkung_tage{zeile+1,gg+1} = str2double(ordner_bewoelkung{tt,2});
                counter=counter+1; % Erhöht den counter um 1.
                
                else % Zweig für die restlichen 4 Tage.
                    
                % Speichern der Bewölkungen für die restlichen Tage
                bewoelkung_tage{counter,gg+1} = str2double(ordner_bewoelkung{tt,2});
                counter=counter+1; % Erhöht den counter um 1.
                
                end % Ende der inneren Abfrage.
            
            end % Ende der äußeren Abfrage.
            
        end % Ende der inneren Schleife. 
            
     % Schleife zum Löschen der bereits verarbeiteten Tage.
     for rr = 1 : length(ordner_bewoelkung)
            
           % Kontrollabfrage des Datums.     
           if strcmp(ordner_bewoelkung{1,1}, bewoelkung_tage{1,gg});
               
               % Löschen der einzelnen Zeilen.
               ordner_bewoelkung(1,:)=[];
                
           end % Ende der Abfrage
            
     end % Ende der Löschschleife. 
        
end % Ende der äußeren Schleife.

T=clock; % Ermitteln der Systemzeit.

% Übertragen der einzelnen Temperaturen des aktuellen Tages.
bewoelkung_aktuell=bewoelkung_tage(:,2);

wolken_dichte_aktuell(1,1)=[bewoelkung_aktuell{T(1,4)+1,1}]; % Ermitteln der aktuellen Bewölkungen.
wolken_dichte_aktuell(2,1)=min([bewoelkung_aktuell{:}]); % Ermitteln der geringsten Bewölkung.
wolken_dichte_aktuell(3,1)=max([bewoelkung_aktuell{:}]); % Ermitteln der maximalen Bewölkung.

% Übertragen der einzelnen Bewölkungen des zweiten Tages.
bewoelkung_tag2 = bewoelkung_tage(:,4);
wolken_dichte_Tage_rest(1,1)=min([bewoelkung_tag2{:}]); % Ermitteln der geringsten Bewölkung.
wolken_dichte_Tage_rest(2,1)=max([bewoelkung_tag2{:}]); % Ermitteln der maximalen Bewölkung.

% Übertragen der einzelnen Bewölkungen des dritten Tages.
bewoelkung_tag3 = bewoelkung_tage(:,6);
wolken_dichte_Tage_rest(1,2)=min([bewoelkung_tag3{:}]); % Ermitteln der geringsten Bewölkung.
wolken_dichte_Tage_rest(2,2)=max([bewoelkung_tag3{:}]); % Ermitteln der maximalen Bewölkung.

% Übertragen der einzelnen Bewölkungen des vierten Tages.
bewoelkung_tag4 = bewoelkung_tage(:,8);
wolken_dichte_Tage_rest(1,3)=min([bewoelkung_tag4{:}]); % Ermitteln der geringsten Bewölkung.
wolken_dichte_Tage_rest(2,3)=max([bewoelkung_tag4{:}]); % Ermitteln der maximalen Bewölkung.

% Übertragen der einzelnen Bewölkungen des fünften Tages.
bewoelkung_tag5 = bewoelkung_tage(:,10);
wolken_dichte_Tage_rest(1,4)=min([bewoelkung_tag5{:}]); % Ermitteln der geringsten Bewölkung.
wolken_dichte_Tage_rest(2,4)=max([bewoelkung_tag5{:}]); % Ermitteln der maximalen Bewölkung.

end % Ende der Funktion

