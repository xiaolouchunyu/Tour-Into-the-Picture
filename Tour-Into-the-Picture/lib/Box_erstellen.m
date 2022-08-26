%% Box_erstellen
    %importieren die Bilds von Mappe 'after_segement'
    
   
    % Bildmatrix nach links und rechts klappen
    for i=1:5
        IM.(['p',num2str(i)]) = imread(['nach_Schneidung',num2str(i),'.jpg']);   
    end
%     if exist ('Vordergrund1.jpg')
%         Vordergrundobjekt_im = imread('Vordergrund1.jpg');
%     end
    global flag;
    
    flag=get(handles.popupmenu4,'Value');
    if(flag==1)   
        Vordergrundobjekt_im = imread('Vordergrund1.jpg');
        %IM.p6 = fliplr(IM.p6);
        Vordergrundobjekt_im = fliplr(Vordergrundobjekt_im);
    else
        Vordergrundobjekt_im=nan;
    end
        IM.p1 = fliplr(IM.p1);
        IM.p2 = imrotate(IM.p2,180);
        IM.p3 = fliplr(IM.p3);
        IM.p4 = fliplr(IM.p4);
        IM.p5 = fliplr(IM.p5);
    
    %% durch Funktion meshgrid erstellen baseXY und baseZ
    % erstellen länge von meshgrid x,y r=1000
    r = 1000;
    [XY,Z] = meshgrid(1:1:r,r:-1:1);
    
    % erstellen Dropdown-Menü, um die Mode von Angel von Kamera einzustellen
    global N
    vall=get(handles.popupmenu1,'Value');
    switch vall
       case 1
            N=5;
       case 2
            N=6;
       case 3
            N=7;
       case 4
            N=8;
       case 5
            N=9;
       case 6
            N=10;
       case 7
            N=11;
       case 8 
            N=12;
       case 9 
            N=13;
       case 10 
            N=14;
       case 11 
            N=15;
    end
    camera(r,N);
    
   
    %%erstellen box von unterschiedlichen Bilds
    % Links Wand
    warp(XY(:,end:-1:1)-r/2,-r./2.*ones(size(XY)),Z,IM.p4);
    % Rückwand
    warp(-r./2.*ones(size(XY)),XY-(1+r)/2,Z,IM.p1);
    % Rechts Wand
    warp(XY-(1+r)/2,r./2.*ones(size(XY)),Z,IM.p5);
    % untere Wand
    warp(XY'-(1+r)/2,XY-(1+r)/2,zeros(size(XY)),IM.p3);
    % obere Wand
    warp(XY'-(1+r)/2,XY-(1+r)/2,r+ones(size(XY)),IM.p2);
    warp(-r./2.*ones(size(XY))/5,(XY-(1+r))/5,Z/5,Vordergrundobjekt_im);
    
    
    iiii=get(handles.popupmenu2,'Value');
    % automatische Fahrt
    if(iiii==2)
    % automatisch wechseln den Betrachtungswinkel
        for k=13:0.2:15
            view(k*6,0);                       
            pause(0.1);
            drawnow;  
        end

        for i=15:-0.5:6
            camva(i);
            pause(0.1);
            drawnow;
        end

        for k=10:0.2:18
            camva(8);
            view(k*6,k);                        
            pause(0.1);
            drawnow;  
        end

        for j=18:-0.5:-14
            camva(8);
            view(18*6,j*2);                       
            pause(0.1);
            drawnow;  
        end

        for l=18:-0.2:10
            camva(8);
            view(l*6,-l);                        
            pause(0.1);
            drawnow;  
        end
    end
%% aufstellen die Parameters von figure
function camera(r,i)
    fig=figure('units','pixels','position',[300 80 500 500],...
                       'Numbertitle','off','menubar','none','resize','off',...
                       'name','3D');
    % erstellen Kartesisches Koordinatensystem,die Parameters sind
    % Bild,Position und 'Parent'
    ax=axes('parent',fig,'position',[-0.2 -0.2 1.5 1.5]);
    hold(ax,'on')
    
    % erstellen Begrenzung von X,Y und Z
    ax.ZLim = [0,r+1];
    ax.XLim = [0-(1+r)/2,r+1-(1+r)/2];
    ax.YLim = [0-(1+r)/2,r+1-(1+r)/2];
    
    % Position von Kamera
    campos([0,0,r/2]);
    
    % Aspekt von Daten
    daspect([1,1,1]);
   
    % Mode von Aspekt von Daten,manual oder auto
    daspect manual;
    
    % Projektion von Kamera,orthographic oder perspective
    camproj(' perspective');
    
    % Position von Ziel von Kamera
    camtarget([0 0 (r+1)/2]);
    
    % Mode von Position von Ziel von Kamera,manual oder auto
    camtarget('manual'); 
    
    % Angle von Kamera
    camva(i);
    
    % Mode von Angel von Kamera, manual oder auto
    camva('manual');
    
    % Ausblick
    view([-3 90.0000]);
    
    % Tool box
    tb = axtoolbar('default');
    cameratoolbar('NoReset')
    tb=cameratoolbar(fig);
    % Tool box,'on' oder 'off'
    tb.Visible = 'on';
 end

