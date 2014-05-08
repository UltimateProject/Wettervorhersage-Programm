function [ geschw_Tag_aktuell, geschw_Tage_rest, staerke_aktuell, staerke_Tage_rest, richtungen_Tage_rest ] = get_windSpeed(daten,datum_system)
% Diese Funktion filtert die Windgeschwingkeiten des aktuellen Tages und 
% die der darauffolgenden 4 Tage aus den heruntergeladenen Informationen.

datum_vergleich=cell(1); % Erstellt ein Cell-Array für das Vergleichsdatum. 


ordner_windgeschw = cell(1,3); % Erstellt ein Cell-Array für die Windgeschwindigkeiten.

zaehler = 1; % Deklaration einer Laufvariable.

% Ermittelt die Länge der zu durchsuchenden Daten.
laenge_structs=length(daten.children{1, 1}.children{1, 2}.children);

% Beginn der "Filter"-Schleife. Diese Schleife filtert die 
% Windgeschwindigkeiten aus den gesamten Wetterinformationen.
for kk = 1 : laenge_structs
               
    % Überprüfung durch If-Abfrage. Diese Abfrage überprüft ob das Wort
    % "temperature" in den einzelnen Pfaden vorhanden sind. 
    if strcmp(daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 1}.name,'temperature');
   
    	% Übergibt Datum mit Uhrzeit in den Cell-Array
        ordner_windgeschw{zaehler,1} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.attributes.from); 
        % Übergibt den Wert der Windgeschwindigkeit in den Cell-Array
        ordner_windgeschw{zaehler,2} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 3}.attributes.mps);
        % Übergibt den Wert der Windstärke in den Cell-Array
        ordner_windgeschw{zaehler,3} = (daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 3}.attributes.beaufort);
        % Übergibt die Gradzahl der Windrichtung in den Cell-Array
        ordner_windgeschw{zaehler,5}=(daten.children{1, 1}.children{1, 2}.children{1, kk}.children{1, 1}.children{1, 2}.attributes.deg);
        % Übergibt die jeweilige Stunde in den Cell-Array.
        ordner_windgeschw(zaehler,4) = cellfun(@(x) x(12:13), ordner_windgeschw(zaehler,1), 'UniformOutput', false);
        % Speichert nur das Datum wieder im Cell-Array.   
        ordner_windgeschw(zaehler,1) = cellfun(@(x) x(1:10), ordner_windgeschw(zaehler,1), 'UniformOutput', false);
        zaehler = zaehler + 1; % Erhöht die Laufvariable um 1.
        
    end % Ende der If-Abfrage.

end % Ende der Schleife.

% Schleife zur Änderung der Schreibweise des Datums.
for ff = 1 : length(ordner_windgeschw)
        
        % Splitten des Datums in die drei Bestandteile.
        datum_teile = strsplit(char(ordner_windgeschw{ff,1}),'-');
        % Zusammensetzen der Bestandteile in der deutschen Schreibweise.
        ordner_windgeschw{ff,1} = strjoin({datum_teile{3}, datum_teile{2}, datum_teile{1}},'.');

end % Ende der Schleife.


geschwindigkeiten_tage=cell(1); % Erstellt ein Cell-Array für die Windgeschwindigkeiten.

% Äußere for-Schleife zur Umstrukturierung der erittelten Windgeschwindigkeiten.
for gg = 1 : 4 : 40
        
    counter=2; % Deklaration einer Laufvariable 
    
    % Überträgt bei jedem Durchlauf das Datum eines neuen Tages. 
    geschwindigkeiten_tage{1,gg}=ordner_windgeschw{1,1};
           
        % Innere for-Schleife zur Umstrukturierung der erittelten Windgeschwindigkeiten.
        for tt = 1 : length(ordner_windgeschw)
            
            % Übertragen des Datums des für den Durchlauf aktuellen Tages.
            datum_vergleich{1,1}=geschwindigkeiten_tage{1,gg};
            % Transformation des Datums zum Vergleich.
            datum_vergleich(1,1) = cellfun(@(x) x(1:2), datum_vergleich(1,1), 'UniformOutput', false);

            % Abfrage zur Überprüfung. Überprüft ob es sich um das gleiche
            % Datum handelt.
            if ordner_windgeschw{tt, 1} == ordner_windgeschw{1,1};
                
                % Überprüft ob es sich um das gleiche Datum wie beim System
                % handelt.
                if datum_system{1,1}==datum_vergleich{1,1}
                
                % Wandelt den Wert der Stunde für die Zuweisung in double-Format um.    
                zeile=str2double(ordner_windgeschw(tt,4));
                % Speichern der Windgeschwindigkeiten des aktuellen Tages.
                geschwindigkeiten_tage{zeile+1,gg+1} = str2double(ordner_windgeschw{tt,2});
                % Speichern der Windstärke des aktuellen Tages.
                geschwindigkeiten_tage{zeile+1,gg+2} = str2double(ordner_windgeschw{tt,3});
                % Speichern der Windrichtungen des aktuellen Tages.
                geschwindigkeiten_tage{zeile+1,gg+3} = str2double(ordner_windgeschw{tt,5});
                counter=counter+1; % Erhöht den counter um 1.
                
                else % Zweig für die restlichen 4 Tage.
                    
                % Speichern der Windgeschwindigkeiten für die restlichen Tage.
                geschwindigkeiten_tage{counter,gg+1} = str2double(ordner_windgeschw{tt,2});
                % Speichern der Windstärke für die restlichen Tage.
                geschwindigkeiten_tage{zeile+1,gg+2} = str2double(ordner_windgeschw{tt,3});
                % Speichern der Windrichtungen für die restlichen Tage.
                geschwindigkeiten_tage{zeile+1,gg+3} = str2double(ordner_windgeschw{tt,5});
                counter=counter+1; % Erhöht den counter um 1.
                
                end % Ende der inneren Abfrage.
            
            end % Ende der äußeren Abfrage.
       
        end % Ende der inneren Schleife. 
            
        % Schleife zum Löschen der bereits verarbeiteten Tage.
        for rr = 1 : length(ordner_windgeschw)
            
            % Kontrollabfrage des Datums.    
            if strcmp(ordner_windgeschw{1,1}, geschwindigkeiten_tage{1,gg});
                    
                % Löschen der einzelnen Zeilen.
                ordner_windgeschw(1,:)=[];
            
            end % Ende der Abfrage
            
        end % Ende der Löschschleife.
        
end % Ende der äußeren Schleife.


T=clock; % Ermitteln der Systemzeit.

% Übertragen der einzelnen Windgeschwindigkeiten des aktuellen Tages.
geschwindigkeiten_aktuell=geschwindigkeiten_tage(:,2);
% Übertragen der einzelnen Windrichtungen des aktuellen Tages.
windrichtung_tag_aktuell = geschwindigkeiten_tage(:,4);
windrichtung_tag_aktuell = [windrichtung_tag_aktuell{:}];

geschw_Tag_aktuell(1,1)=[geschwindigkeiten_aktuell{T(1,4)+1,1}]; % Ermitteln der aktuellen Windgeschwindigkeit.
[geschw_Tag_aktuell(2,1),richtung_min]=min([geschwindigkeiten_aktuell{:}]); % Ermitteln der niedrigsten Windgeschwindigkeit.
[geschw_Tag_aktuell(3,1),richtung_max]=max([geschwindigkeiten_aktuell{:}]); % Ermitteln der maximalen Windgeschwindigkeit.
geschw_Tag_aktuell(1,2) = geschwindigkeiten_tage{T(1,4)+1,4};     % Ermitteln der aktuellen Windrichtung.
geschw_Tag_aktuell(2,2) = windrichtung_tag_aktuell(richtung_min); % Ermitteln der niedrigsten Windrichtung.
geschw_Tag_aktuell(3,2) = windrichtung_tag_aktuell(richtung_max); % Ermitteln der maximalen Windrichtung.

% Übertragen der einzelnen Windgeschwindigkeiten und die Windrichtung des zweiten Tages.
geschwindigkeiten_tag2 = geschwindigkeiten_tage(:,6);
geschw_Tage_rest(1,1) = min([geschwindigkeiten_tag2{:}]); % Ermitteln der niedrigsten Windgeschwindigkeit.
geschw_Tage_rest(2,1) = max([geschwindigkeiten_tag2{:}]); % Ermitteln der maximalen Windgeschwindigkeit.
richtungen_Tage_rest(1,1) = max([geschwindigkeiten_tage{:,8}]); % Ermitteln der Windrichtung.


% Übertragen der einzelnen Windgeschwindigkeiten und die Windrichtung des dritten Tages.
geschwindigkeiten_tag3 = geschwindigkeiten_tage(:,10);
geschw_Tage_rest(1,2)=min([geschwindigkeiten_tag3{:}]); % Ermitteln der niedrigsten Windgeschwindigkeit.
geschw_Tage_rest(2,2)=max([geschwindigkeiten_tag3{:}]); % Ermitteln der maximalen Windgeschwindigkeit.
richtungen_Tage_rest(1,2) = max([geschwindigkeiten_tage{:,12}]); % Ermitteln der Windrichtung.

% Übertragen der einzelnen Windgeschwindigkeiten und die Windrichtung des vierten Tages.
geschwindigkeiten_tag4 = geschwindigkeiten_tage(:,14);
geschw_Tage_rest(1,3)=min([geschwindigkeiten_tag4{:}]); % Ermitteln der niedrigsten Windgeschwindigkeit.
geschw_Tage_rest(2,3)=max([geschwindigkeiten_tag4{:}]); % Ermitteln der maximalen Windgeschwindigkeit.
richtungen_Tage_rest(1,3) = max([geschwindigkeiten_tage{:,16}]); % Ermitteln der Windrichtung.

% Übertragen der einzelnen Windgeschwindigkeiten und die Windrichtung des fünften Tages.
geschwindigkeiten_tag5 = geschwindigkeiten_tage(:,18);
geschw_Tage_rest(1,4)=min([geschwindigkeiten_tag5{:}]); % Ermitteln der niedrigsten Windgeschwindigkeit.
geschw_Tage_rest(2,4)=max([geschwindigkeiten_tag5{:}]); % Ermitteln der maximalen Windgeschwindigkeit.
richtungen_Tage_rest(1,4) = max([geschwindigkeiten_tage{:,20}]); % Ermitteln der Windrichtung.

% Hier das gleiche nochmal für die Windstärke

% Übertragen der einzelnen Windstärken des aktuellen Tages.
windstaerke_aktuell=geschwindigkeiten_tage(:,3);

% Übertragen der einzelnen Windstärken des zweiten Tages.
staerke_aktuell(1,1)=[windstaerke_aktuell{T(1,4)+1,1}]; % Ermitteln der aktuellen Windstärke.
staerke_aktuell(2,1)=min([windstaerke_aktuell{:}]); % Ermitteln der niedrigsten Windstärke.
staerke_aktuell(3,1)=max([windstaerke_aktuell{:}]); % Ermitteln der maximalen Windstärke.

% Übertragen der einzelnen Windstärken des zweiten Tages.
windstaerke_tag2 = geschwindigkeiten_tage(:,6);
staerke_Tage_rest(1,1)=min([windstaerke_tag2{:}]); % Ermitteln der niedrigsten Windstärke.
staerke_Tage_rest(2,1)=max([windstaerke_tag2{:}]); % Ermitteln der maximalen Windstärke.

% Übertragen der einzelnen Windstärken des dritten Tages.
windstaerke_tag3 = geschwindigkeiten_tage(:,9);
staerke_Tage_rest(1,2)=min([windstaerke_tag3{:}]); % Ermitteln der niedrigsten Windstärke.
staerke_Tage_rest(2,2)=max([windstaerke_tag3{:}]); % Ermitteln der maximalen Windstärke.

% Übertragen der einzelnen Windstärken des vierten Tages.
windstaerke_tag4 = geschwindigkeiten_tage(:,12);
staerke_Tage_rest(1,3)=min([windstaerke_tag4{:}]); % Ermitteln der niedrigsten Windstärke.
staerke_Tage_rest(2,3)=max([windstaerke_tag4{:}]); % Ermitteln der maximalen Windstärke.

% Übertragen der einzelnen Windstärken des fünften Tages.
windstaerke_tag5 = geschwindigkeiten_tage(:,15);
staerke_Tage_rest(1,4)=min([windstaerke_tag5{:}]); % Ermitteln der niedrigsten Windstärke.
staerke_Tage_rest(2,4)=max([windstaerke_tag5{:}]); % Ermitteln der maximalen Windstärke.



end% Ende der Funktion

%--------------------Licence ---------------------------------------------
% Copyright (c) <2014> Marc Hieronimus, Joseffa Baumann

