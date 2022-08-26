function pos = recterstellen(image)

    figure(1);
    imshow(image); 
    pos=[];
    g = imrect(gca);%Mit der Maus verschiebbare Rechtecke erstellen
    pos=getPosition(g);
    
    %pos hat vier Werte, 
    % nämlich die Koordinaten x y der linken unteren Ecke des rechteckigen Kastens 
    % sowie die Breite und Höhe des Kastens

    pixel_matrix=double(image);

end
