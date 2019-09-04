function Clumsychild(c1,m);
% 实现元胞以固定的概率向相邻的4个元胞扩散?
% Example:?
%??? Clumsychild(0.1,0.1);?
% Author's email:zjliu2001@163.com?
N=100;
rand('state',0);
A=randperm(N^2);     %整数随机置换 
S=zeros(N);
S(A(1:3000))=3; % 30%的位置是状态3?
S(A(3001:5000))=1; % 20%的位置是状态1?
S(A(5001:6000))=2; % 10%的位置是状态2?
clear A;close all;
figure('position',[159 42 567 427]);
imagesc([1:4]')
set(gca,'YAxisLocation','right');
set(gca,'YAxisLocation','right');
set(gca,'position',[0.8,0.1,0.1,0.8])
set(gca,'position',[0.84,0.12,0.1,0.8])
set(gca,'xtick',[]);
set(gca,'ytick',[1:4]);
set(gca,'yticklabel',num2str([0:3]'));
axes('position',[0.06,0.12,0.7,0.8]);
H=imagesc(S);
set(gcf,'position',[159 42 485 427]);
set(gcf,'doublebuffer','on');
xlabel('Please press "space" key and stop this program!','fontsize',12,'color','r');
title(['c1=',num2str(c1),' m=',num2str(m)]);
k=1;
while k
     pause(0.5);
     s=get(gcf,'currentkey');
     if strcmp(s,'space');
         clc;k=0;
     end
     S=evolvement(S,c1,m);
     set(H,'CData',S);
end
figure(gcf);

function S=evolvement(S,c1,m);
P=zeros(size(S));
Da=rand(size(S));
Da(Da>1-c1)=1;
Da(Da<1-c1)=0;
P(S==1 | S==2)=1;
R=round(rand(size(S))+1);
P=P.*R.*Da;
V=round(rand(size(S))*3)+1;
V=V.*P; % V是速度方向:?
%?? 1 --- up?
%?? 2 --- down
%?? 3 --- left?
%?? 4 --- right?
V(1,V(1,1:end)==1)=0;
V(end,V(end,1:end)==2)=0;
V(V(1:end,1)==3,1)=0;
V(V(1:end,end)==4,end)=0;
% 产生后代?
[x,y]=find(V==1);
DD=zeros(size(S));
DD(x-1,y)=P(x-1,y);
S(S==0 | S==2 & DD==1)=1;
S(S==0 & DD==2)=2;
[x,y]=find(V==2);
DD=zeros(size(S));
DD(x+1,y)=P(x+1,y);
S(S==0 | S==2 & DD==1)=1;
S(S==0 & DD==2)=2;
[x,y]=find(V==3);
DD=zeros(size(S));
DD(x,y-1)=P(x,y-1);
S(S==0 | S==2 & DD==1)=1;
S(S==0 & DD==2)=2;
[x,y]=find(V==4);
DD=zeros(size(S));
DD(x,y+1)=P(x,y+1);
S(S==0 | S==2 & DD==1)=1;
S(S==0 & DD==2)=2;
Dr=rand(size(S));
S(S<3 & Dr<m)=0;