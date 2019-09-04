clear
clc

[theta,theta_d1,theta_d2,t2,t4,v_x,k]=GCsystemSolution(0.6058,8.1792,6.6300,19885,1/1000,1);
(max(theta(k:end)).*180)./pi
(min(theta(k:end)).*180)./pi
