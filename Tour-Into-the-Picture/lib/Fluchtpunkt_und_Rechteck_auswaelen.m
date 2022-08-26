%% Fluchtpunkt und Rechteck erstellen

    global flag;
    
    flag=get(handles.popupmenu4,'Value');
    
    if(flag==1)   
        Bild=imread('imageimage1.jpg');
    else
        Bild=handles.Bild;
    end
    axes(handles.axes1); 
    cla reset;
    
    % Bilder anzeigen
    imshow(Bild);
    
    % Fluchtpunktkoordinaten speichern
    [x0,y0]=ginput(1);
    hold on;
    plot(x0,y0,'Marker','o','MarkerFaceColor','red','MarkerSize',10); % Fluchtpunkt zeichnen
    
    % ein neues Array pos erstellen 
    pos=[];
    
    % ein per Maus ziehbares Rechteck zu erstellen
    g = imrect(gca);
    
    % Die Koordinaten x y der unteren linken Ecke des Rechtecks ​​
    % sowie die Breite und Höhe des Rechtecks ​​werden im Array pos
    % gespeichert.
    pos=getPosition(g);
    
    % global Variable pos hinzufügen
    handles.pos=pos;
    guidata(hObject,handles);
    %Lesen Sie das Bild, nachdem Sie den Hintergrund ausgefüllt haben
    
    
    % Bildbreite und Bildlänge erhalten und speichern
    width=size(Bild,2); 
    handles.width=width;
    guidata(hObject,handles);
    length=size(Bild,1); 
    handles.length=length;
    guidata(hObject,handles);
    
    % Steigungen der vier Geraden berechnen 
    k1=(pos(2)-y0)/(pos(1)-x0);
    k2=(pos(2)-y0)/(pos(1)+pos(3)-x0);
    k3=(pos(2)+pos(4)-y0)/(pos(1)+pos(3)-x0);
    k4=(pos(2)+pos(4)-y0)/(pos(1)-x0);
    
    % die Variablen in die Handles-Struktur schreiben
    handles.k1=k1;
    guidata(hObject,handles);
    handles.k2=k2;
    guidata(hObject,handles);
    handles.k3=k3;
    guidata(hObject,handles);
    handles.k4=k4;
    guidata(hObject,handles);
    
    % Schnittpunktberechnung von vier Geraden
    b1=pos(2)-k1*pos(1);
    b2=pos(2)-k2*(pos(1)+pos(3));
    b3=pos(2)+pos(4)-k3*(pos(1)+pos(3));
    b4=pos(2)+pos(4)-k4*pos(1);
    
    % die Variablen in die Handles-Struktur schreiben
    handles.b1=b1;
    guidata(hObject,handles);
    handles.b2=b2;
    guidata(hObject,handles);
    handles.b3=b3;
    guidata(hObject,handles);
    handles.b4=b4;
    guidata(hObject,handles);
    
    % vier Geraden definieren
    xx1=linspace(0,x0);
    yy1=k1*xx1+b1;
    xx2=linspace(x0,width);
    yy2=k2*xx2+b2;
    xx3=linspace(x0,width);
    yy3=k3*xx3+b3;
    xx4=linspace(x0,0);
    yy4=k4*xx4+b4;
    
    % vier Linien zeichnen
    plot(xx1,yy1,'g','LineWidth',2);
    plot(xx2,yy2,'g','LineWidth',2);
    plot(xx3,yy3,'g','LineWidth',2);
    plot(xx4,yy4,'g','LineWidth',2);
