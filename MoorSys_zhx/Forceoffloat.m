function [force]=Forceoffloat(density, g, D, h)
% density 海水密度
% g 重力加速度
% D 直径
% h 吃水深度
force = density.* g .* (pi.* (0.5.*D).^2) .* h;