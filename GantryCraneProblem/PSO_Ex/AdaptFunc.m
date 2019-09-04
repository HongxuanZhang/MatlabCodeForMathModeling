function y = AdaptFunc(x)
    %y = ((sin(x(1)^2+x(2)^2))^2-cos(x(1)^2+x(2)^2)+1)/((1+0.1*(x(1)^2+x(2)^2))^2)-0.7;
    mass = findMaxMass(x(1),x(2),x(3),1/100);
    if mass ~=-1000
        [theta,~,~,t2,t4,v_x,k] = GCsystemSolution(x(1),x(2),x(3),mass,1/100,0);
        if t2<0 ||t4<0 || x(2)+t2+x(3)+t4 >= 1300 || abs(v_x)>0.5  % 第一问要求2分钟内
            y = 100000;
        else
            y = ((max(theta(k:end))./pi).*180)+(mass./(x(2)+t2+x(3)+t4).^3).^(-1);
        end
    else
        y = 100000;
    end
end