function [phi_angle,free_zone,h] = moorsys(anchor_type,anchor_length,m_zwq,H,v_wind,v_water,needdisp)
% 锚链的种类，锚链长度，重物球质量，海水深度，风速，水速
g = 9.8;
density_sea = 1025;

anchor_node =...
    [
    0.0780    0.1050    0.1200    0.1500    0.1800;  %每节长度/m
    0.2496    0.7350    1.5000    2.9250    5.0616;  %每节质量/kg
    0.3174    0.9346    1.9073    3.7192    6.4359;  %每节所受的浮力/N
    0.0227    0.0336    0.0449    0.0561    0.0673;  %每种链条的估计直径值/m
    ];
nchain = round(anchor_length/anchor_node(1,anchor_type));

m   =  [1000,10*ones(1,4),100,anchor_node(2,anchor_type)*ones(1,nchain)] ;  % 质量
lg  =  [2,1*ones(1,4),1,anchor_node(1,anchor_type)*ones(1,nchain)]      ;   % 长度，或者说是吃水深度
da  =  [2,0.05*ones(1,4),0.3,anchor_node(4,anchor_type)*ones(1,nchain)];    % 直径

phi = zeros(1,1+4+1+nchain); %浮标 钢管 钢桶 锚链的各个链节的角系统 与竖直方向夹角

Fv = Forceoffloat(density_sea,g,da,lg) - m.*g;  % Froce vertical

hmin = 0;
hmax = 2;
h_sum = 0;
while hmax - hmin > 10^(-5)
    h = (hmin+hmax)/2;
    Fv(1) = density_sea*pi.*1^2*h*g-m(1).*g;
    Fwind = 0.625.*2.*(2-h).*(v_wind)^2; % 海风对浮标的作用力
    Fwater = ForceofWater(v_water,lg,da,phi);
    phi = solvePhi(Fwind,Fwater,Fv,m_zwq);
    h_sum = sum(lg(2:end).*cos(phi(2:end)))+h;
    if h_sum>H
        hmax = h;
    else
        hmin = h;
    end
end
phi_angle = phi./pi*180;
vpa(phi_angle);
length_sink = sum(phi_angle==90).*anchor_node(1,anchor_type); % 沉底的锚链长度
free_zone = sum(lg(2:end).*sin(phi(2:end)));
if needdisp
    X = sprintf('钢桶的倾斜角是%-.5f °,浮标的吃水深度为%f m',phi_angle(6),h);
    Y = sprintf('四个钢管的倾斜角分别是%f °,%f °,%f°,%f°',phi_angle(2),phi_angle(3),phi_angle(4),phi_angle(5));
    Z = sprintf('沉底的锚链长度为%.4f m, 自由游动区域半径%f m',length_sink,free_zone);
    disp(X);
    disp(Y);
    disp(Z);
end


