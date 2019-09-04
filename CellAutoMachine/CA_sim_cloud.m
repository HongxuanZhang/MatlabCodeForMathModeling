function CA_sim_cloud;
% 使用元胞自动机模拟地球卫星的云图?
%?
% reference:?
% Piazza, E.; Cuccoli, F.;?
% Cellular Automata Simulation of Clouds in Satellite Images,?
% Geoscience and Remote Sensing Symposium, 2001. IGARSS '01.?
% IEEE 2001 International Volume 4,? 9-13 July 2001 Page(s):?
% 1722 - 1724 vol.4 Digital Object Identifier 10.1109/IGARSS.?
% 2001.977050?
time=888;% 程序执行步数?
M=240;
N=320;
S=round(rand(M,N)*15);
p=[1,2,1,6,6,1,2,1];
p=sum(tril(meshgrid(p)),2)/20;
rand('state',0);
SS=S;
R=rand(M,N);
G=R;
B=R;
C=cat(3,R,G,B);
fig=figure;
set(fig,'DoubleBuffer','on');
mov = VideoWriter('example2.avi');
cc=imshow(C,[]);
set(gcf,'Position',[13 355 157 194])
x1=(1:3)+round(M/2);y1=(1:3)+round(N/3);
x2=(1:3)+round(M/3);y2=(1:3)+round(N/2);
x3=(1:3)+round(M/1.5);y3=(1:3)+round(N/2);
q=0;
qq=15/4;
open(mov)
while q<time;
    SS=zeros(M,N);
    for k=1:15;
        r=rand(M,N); % 生成几率r??????????
        K=zeros(M+2,N+2);
        T=(S-k>=0); % 粒子数矩阵?
        K(2:end-1,2:end-1)=T;
        SS=K(1:end-2,1:end-2).*(r<p(1))+...?
            K(1:end-2,2:end-1).*(r<p(2) & r>=p(1))+...?
            K(1:end-2,3:end).*(r<p(3) & r>=p(2))+...?
            K(2:end-1,1:end-2).*(r<p(4) & r>=p(3))+...?
            K(2:end-1,3:end).*(r<p(5) & r>=p(4))+...?
            K(3:end,1:end-2).*(r<p(6) & r>=p(5))+...?
            K(3:end,2:end-1).*(r<p(7) & r>=p(6))+...?
            K(3:end,3:end).*(r>=p(7))+SS;
    end
    S=SS; %SS是粒子扩散后的分布?
    S(S>15)=15;
    S(x1,y1)=15;
    S(x2,y2)=15;
    S(x3,y3)=15; % 粒子源赋值?
    G=(S<=7.5);
    B=(S>qq);
    R=(S>qq & S<=7.5);
    C=double(cat(3,R,G,B));
    set(cc,'CData',C);
    q=q+1;
    pause(0.2);
    title(['q=',num2str(q)]);
    Nu(q)=sum(S(1:end));
    F = getframe(gca);
    writeVideo(mov,F);
end
mov = close(mov);
figure;
plot(Nu)