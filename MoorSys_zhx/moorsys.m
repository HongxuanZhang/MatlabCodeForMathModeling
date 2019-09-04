function [phi_angle,free_zone,h] = moorsys(anchor_type,anchor_length,m_zwq,H,v_wind,v_water,needdisp)
% ê�������࣬ê�����ȣ���������������ˮ��ȣ����٣�ˮ��
g = 9.8;
density_sea = 1025;

anchor_node =...
    [
    0.0780    0.1050    0.1200    0.1500    0.1800;  %ÿ�ڳ���/m
    0.2496    0.7350    1.5000    2.9250    5.0616;  %ÿ������/kg
    0.3174    0.9346    1.9073    3.7192    6.4359;  %ÿ�����ܵĸ���/N
    0.0227    0.0336    0.0449    0.0561    0.0673;  %ÿ�������Ĺ���ֱ��ֵ/m
    ];
nchain = round(anchor_length/anchor_node(1,anchor_type));

m   =  [1000,10*ones(1,4),100,anchor_node(2,anchor_type)*ones(1,nchain)] ;  % ����
lg  =  [2,1*ones(1,4),1,anchor_node(1,anchor_type)*ones(1,nchain)]      ;   % ���ȣ�����˵�ǳ�ˮ���
da  =  [2,0.05*ones(1,4),0.3,anchor_node(4,anchor_type)*ones(1,nchain)];    % ֱ��

phi = zeros(1,1+4+1+nchain); %���� �ֹ� ��Ͱ ê���ĸ������ڵĽ�ϵͳ ����ֱ����н�

Fv = Forceoffloat(density_sea,g,da,lg) - m.*g;  % Froce vertical

hmin = 0;
hmax = 2;
h_sum = 0;
while hmax - hmin > 10^(-5)
    h = (hmin+hmax)/2;
    Fv(1) = density_sea*pi.*1^2*h*g-m(1).*g;
    Fwind = 0.625.*2.*(2-h).*(v_wind)^2; % ����Ը����������
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
length_sink = sum(phi_angle==90).*anchor_node(1,anchor_type); % ���׵�ê������
free_zone = sum(lg(2:end).*sin(phi(2:end)));
if needdisp
    X = sprintf('��Ͱ����б����%-.5f ��,����ĳ�ˮ���Ϊ%f m',phi_angle(6),h);
    Y = sprintf('�ĸ��ֹܵ���б�Ƿֱ���%f ��,%f ��,%f��,%f��',phi_angle(2),phi_angle(3),phi_angle(4),phi_angle(5));
    Z = sprintf('���׵�ê������Ϊ%.4f m, �����ζ�����뾶%f m',length_sink,free_zone);
    disp(X);
    disp(Y);
    disp(Z);
end


