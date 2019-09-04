function [phi]=solvePhi(F_wind,F_water,F_vertical,m_zwq)
% ��ֱ�����ϵ��������� ˮ�ĳ����� ������� ������ �����ˮ�߶�
density_sea = 1025;
density_steel = 7900;
g=9.8;
Nc = length(F_vertical);  % ��������ĳ���
phi = zeros(1,Nc);        % ��ֱ����ļн�
theta = zeros(1,Nc);      % ������ֱ����ļн�
F = zeros(1,Nc);         
% ����ֱ������е�ˮƽ������� �Լ���ֱ�������
for i = 1: Nc-1
    Fx = F(i).*sin(theta(i)) + F_water(i);       % ��ʼʱ��0 �����괦ǡ��Ҳ��0 �����Կ�����ô
    Fy = F(i).*cos(theta(i)) + F_vertical(i);
    if i==1
        Fx = Fx+F_wind; % ֻ�и����з��������
    end
    if i==6
        Fy = Fy + density_sea.* g .* (m_zwq./density_steel) - m_zwq.*g; % ��Ͱ�������������
    end
    F(i+1) =  sqrt(Fx.^2+Fy.^2);
    theta(i+1) = acos(Fy/F(i+1));
    if(theta(i+1)>pi/2)
        theta(i+1) = pi/2;
    end
end
phi =atan2( F.*sin(theta)+F_water/2, F.*cos(theta)+F_vertical/2);
%phi =atan( (F.*sin(theta)+F_water/2)/(F.*cos(theta)+F_vertical/2));
phi(phi>pi/2) = pi/2; 
phi(1) = 0;





