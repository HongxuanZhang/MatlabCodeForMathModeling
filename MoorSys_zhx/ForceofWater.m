function [force] = ForceofWater(v_water,h, D, phi) 
% v_water ˮ�ٶ�
% h ˮ�и߶�
% D ֱ��
%����ˮ����������� 
force = 374.*D.*h.*v_water.^2.*cos(phi);