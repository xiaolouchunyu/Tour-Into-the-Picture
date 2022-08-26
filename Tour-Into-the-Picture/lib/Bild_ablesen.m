%% Bild_ablesen
axes(handles.axes1); % Das Bild wird auf der Achse1 angezeigt.
[filename,pathname]=uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif'},'Pick an image'); % Wählen Sie Fotos aus dem Ordner aus.Das Bildformat kann bmp, jpg, png, jpeg, tif sein.
str=[pathname filename]; % Dateiname und der Dateipfad in die Reihe 'str' gespeichert.
if isequal(filename,0)||isequal(pathname,0)
    warndlg('Please select a picture first!','Warning'); % Wenn kein Bild ausgewählt ist, wird eine Fehlermeldung ausgegeben.
    return;
else
    Bild= imread(str); % Bild ablesen    
    imshow(Bild); % Bilder anzeigen	  
end
handles.Bild=Bild; % Bild in die handle-Struktur schreiben
guidata(hObject,handles); % Daten speichern

