function [value] = calculateObjectValueByNormalize(anchor_type,anchor_length,mass)
mean_phi = 2.6979;
mean_zone = 16.0364;
mean_hw = 1.7031;
weight = [  0.8975    0.0559    0.0466];  % 利用熵值法求得各权重， 分别是 钢桶倾斜角 活动区域 以及吃水深度
max = [16.4365   24.1749    2.0000];     % 钢桶角度 游动区域 吃水深度
min = [0.0232    5.2593    0.8294];
v_wind = 36;
v_water = 1.5;
H = 16:20;
val = zeros(1,length(H));
i=1;
for h = 16:20
    [phi,f_zone,h_s] = moorsys(anchor_type,anchor_length,mass,h,v_wind,v_water,0);
    if  90-phi(end) > 16 || h_s > 1.999
        val(i) = 500;
    else
        val(i) = weight(1).*((phi(6)-min(1))./(max(1)-min(1))).^2+weight(2).*((f_zone-min(2))./(max(2)-min(2))).^2+weight(3).*((h-min(3))./(max(3)-min(3))).^2;
    end
    i=i+1;
end
value = sum(val)./length(val);