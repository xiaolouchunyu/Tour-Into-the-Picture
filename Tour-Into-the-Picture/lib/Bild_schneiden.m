%% Bild_schneiden
% Bild=handles.newbild;
% Lesen Sie das Bild, nachdem Sie den Hintergrund ausgefüllt haben
    global flag;
    flag=get(handles.popupmenu4,'Value');
    if(flag==1)   
        Bild=imread('imageimage1.jpg');
    else
        Bild=handles.Bild;
    end
        width=handles.width;
        length=handles.length;
        pos=handles.pos;
        k1=handles.k1;
        k2=handles.k2;
        k3=handles.k3;
        k4=handles.k4;
        b1=handles.b1;
        b2=handles.b2;
        b3=handles.b3;
        b4=handles.b4;
        
        % Berechnung des Schnittpunkts am Rand eines Bildes
        j1 = -b1/k1; 
        % x-Koordinate des ersten Punktes des inneren Rahmens
        a1 = ceil(pos(1));
        % x-Koordinate des zweiten Punktes des inneren Rahmens
        a2 = ceil(pos(1)+pos(3));
    
        % Unterteilung eines Bildes in fünf Bilder auf der Grundlage 
        % von perspektivischen Punkten und inneren Rahmen
        image2 = imcrop(Bild,[-b1/k1 0 width pos(2)]);
        image5 = imcrop(Bild,[0 pos(2) pos(1) pos(2)+pos(4)]);
        image3 = imcrop(Bild,[(length-b4)/k4 pos(2)+pos(4) width length]);
        image4 = imcrop(Bild,[pos(1)+pos(3) pos(2) width pos(2)+pos(4)]);
        image1 = imcrop(Bild,pos);
        
        
        % Bild speichern
        
        if ~exist('nach_Schneidung','dir')
           mkdir('nach_Schneidung');
        end
        
        imwrite(image1,['nach_Schneidung',num2str(1),'.jpg']);
        imwrite(image2,['nach_Schneidung',num2str(2),'.jpg']);
        imwrite(image3,['nach_Schneidung',num2str(3),'.jpg']);
        imwrite(image4,['nach_Schneidung',num2str(4),'.jpg']);
        imwrite(image5,['nach_Schneidung',num2str(5),'.jpg']);
        
        
        

