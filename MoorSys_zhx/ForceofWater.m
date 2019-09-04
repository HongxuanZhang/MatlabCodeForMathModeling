function [force] = ForceofWater(v_water,h, D, phi) 
% v_water 水速度
% h 水中高度
% D 直径
%计算水对其的作用力 
force = 374.*D.*h.*v_water.^2.*cos(phi);