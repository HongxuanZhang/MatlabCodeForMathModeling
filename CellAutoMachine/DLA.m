%% DLA
% ÓÐÏÞÀ©É¢Äý¾Û
clc;clear;close all;
S=ones(40,100);% state matrix
S(end,:)=0; % initial sttae
Ss=zeros(size(S)+[1,0]); % top line is origin of particle
Ss(2:end,:)=S; % showing matrix
N=size(S,2);
II=imagesc(Ss);
axis equal;
colormap(gray)
set(gcf,'DoubleBuffer','on');
while sum(1-S(1,:))<0.5;
    y=1;
    x=round(rand*[N-1]+1); % random position
    D=0;
    while D<0.5; % random travel
        r=rand;
        if abs(x-1)<0.1;
            SL=1;
        else
            SL=S(y,x-1);
        end
        if abs(x-N)<0.1;
            SR=1;
        else
            SR=S(y,x+1);
        end
        if SL+SR+S(y+1,x)<2.5; % check the neighbor: left, right, under????????????
            D=1;
            S(y,x)=0; % stop in the position
        end
        if r<=1/3; % travel randomly
            x=x-1;
        elseif r<=2/3;
            x=x+1;
        else
            y=y+1;
        end
        Ss(2:end,:)=S;
        if x<0.5||x>N+0.5;
            D=1; % out of the range
        else
            Ss(y,x)=0; % to show the moving particle
        end
        set(II,'CData',Ss); % to show
        pause(0.1);
    end
end