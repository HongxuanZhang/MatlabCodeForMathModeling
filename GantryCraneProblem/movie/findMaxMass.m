function [mass]= findMaxMass(a,t1,t3,delta_t)
m = -1000;
for m = 19000:1:20001
    [theta,theta_d1,theta_d2,t2,t4,v_x,k] = GCsystemSolution(a,t1,t3,m,delta_t,0);
    if k ~= -1000
        mass = m;
    else
        break;
    end
end