function [phi]=solvePhi(F_wind,F_water,F_vertical,m_zwq)
% 竖直方向上的所有力， 水的冲力， 风冲力， 重物球， 浮标吃水高度
density_sea = 1025;
density_steel = 7900;
g=9.8;
Nc = length(F_vertical);  % 传入数组的长度
phi = zeros(1,Nc);        % 竖直方向的夹角
theta = zeros(1,Nc);      % 力与竖直方向的夹角
F = zeros(1,Nc);         
% 下面分别处理所有的水平方向的力 以及竖直方向的力
for i = 1: Nc-1
    Fx = F(i).*sin(theta(i)) + F_water(i);       % 开始时是0 ，浮标处恰好也是0 ，所以可以这么
    Fy = F(i).*cos(theta(i)) + F_vertical(i);
    if i==1
        Fx = Fx+F_wind; % 只有浮标有风的作用力
    end
    if i==6
        Fy = Fy + density_sea.* g .* (m_zwq./density_steel) - m_zwq.*g; % 钢桶还有重物球的力
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





