
figure('Position',[15 30 997 658],'NumberTitle','off');
set(gcf,'name','???? 六边形的元胞自动机上的单粒子运动');

% Reference:
% U. Frisch, B. Hasslacher, Y. Pomeau, Lattice-gas
% automata for the Navier-Stokes rquation, Phys. Rev.?
% Lett. 1986,56: 1505-1508
set(gcf,'DoubleBuffer','on');
axis square;box on;
set(gca,'XColor','r','YColor','r');
set(gca,'Position',[-0.01 0.11 0.775 0.815]);
L=17.5*0.1/sqrt(3);
axis([0,L,0,1]); hold on;
for p=0:.1:0.9;
    plot([0,(1-p)/sqrt(3)],[p,1],'k');
end
for p=0:0.1/sqrt(3):1;
    plot([p,min(p+1/sqrt(3),17.5*0.1/sqrt(3))],[0,min(1,(L-p)*sqrt(3))],'k');
end
for p=0:0.1/sqrt(3):1;
    plot([0,p],[p*sqrt(3),0],'k');
end
for p=0:9;
    plot([L-[0.05+p/10]/sqrt(3),L],[1,1-[0.05+p/10]],'k');
end
for p=0:0.05:1;
    plot([0,L],[p,p],'k');
end
po=plot(0.8/sqrt(3),0.5,'r.','markersize',24);
pz=0.8/sqrt(3)+0.5i; % the position of read point
A=pi/3*2;% the movement direction of read point

gc=gca;
a1=axes('Position',[0.7,0.5,0.25,0.3]);
axis square;hold on;axis([0,1,0,1]);
plot([0.5+0.5i,(1+1i)/2+0.4*exp(1i*pi/3*2)]);
plot([0.5+0.5i,(1+1i)/2+0.4*exp(1i*pi/3)]);
plot([0.3,0.7],[0.5,0.5]);
text(0.2,0.8,'Y','fontsize',14);
text(0.73,0.8,'X','fontsize',14);
text(0.2,0.4,'Z','fontsize',14);
axes(gc);
dt=0.1/sqrt(3); k=0;

ses=['while k;',...
    'pz=pz+dt*exp(1i*A);',...
    'if imag(pz)>0.99 | imag(pz)<0.01;',...????????
    '??? A=-A;',...
    'end;',...
    'if real(pz)>0.99 | real(pz)<0.01;',...
    '??? A=-A-pi;',...
    'end;',...
    'set(po,''XData'',real(pz),''YData'',imag(pz));',...
    'pause(0.2);',...
    'end;'];
po1=uicontrol(gcf,'style','push',...
    'unit','normalized','position',[0.74,0.87,0.1,0.08],...
    'string','start','fontsize',18,'callback',[]);
set(po1,'callback',['k=~k;if k==1;',...
    'set(po1,''string'',''stop'');',...
    'else set(po1,''string'',''start'');',...
    'end;',ses]);
