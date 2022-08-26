%% Vordergrundobjekt
    global m_1;
    % Bild lesen
    m_1=handles.Bild;  %Bild lesen
    %figure;
    %imshow(m_1);
    % Beschneidungsbereich definieren
    g = imrect(gca); 
    pos=getPosition(g);
    % Machen Sie einen Bildschnitt
    x_1=imcrop(m_1,pos); 
    %figure;
    % Beschnittenes Bild anzeigen  
    %imshow(x_1);   
   
    imwrite(x_1,'vordergrund1.jpg');  
    
    % Bildbreite erhalten
    width=size(m_1,2); 
    % Bildlänge erhalten
    length=size(m_1,1); 
    
    m_1(ceil(pos(2)):ceil(pos(2)+pos(4)),ceil(pos(1)):ceil(pos(1)+pos(3)),:) = 0;
    %figure(2)
    %imshow(m_1)
    
    imwrite(m_1,'vordergrund2.jpg'); 

