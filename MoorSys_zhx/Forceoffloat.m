function [force]=Forceoffloat(density, g, D, h)
% density ��ˮ�ܶ�
% g �������ٶ�
% D ֱ��
% h ��ˮ���
force = density.* g .* (pi.* (0.5.*D).^2) .* h;