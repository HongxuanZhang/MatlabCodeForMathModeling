 a = 0.6058;
 t1 = 8.1792;
 t3 = 6.6300;
 L = 15;
 g = 9.8;
 delta_t = 1/1000;
 
 m = 19885;
 
 [theta,theta_d1,theta_d2,t2,t4,v_x,k] = GCsystemSolution(a,t1,t3,m,1/1000,0);
 
 t_1 = 0:delta_t:t1;
m_x1 = 0.5.*a.*(t_1).^2;
t_2 = t1+delta_t:delta_t:t1+t2;
m_x2 = max(m_x1)+a.*t1.*(t_2-t1);
t_3 = t1+t2+delta_t:delta_t:t1+t2+t3;
m_x3 = max(m_x2)+a.*t1.*(t_3-t1-t2)-0.5.*a.*(t_3-t1-t2).^2;
t_4 = t1+t2+t3+delta_t:delta_t:t1+t2+t3+t4;
m_x4 = max(m_x3)+a.*(t1-t3).*(t_4-(t1+t2+t3));
x = [m_x1,m_x2,m_x3,m_x4];
Time = [t_1,t_2,t_3,t_4];
[theta,theta_d1,theta_d2,t2,t4,v_x,k] = GCsystemSolution(a,t1,t3,m,1/1000,0);
T = zeros(1,length(x));


for i = 1:length(Time)
    if Time(i)<t1
        T(i) =m*g*cos(theta(i))+m*a*sin(theta(i))+(m*theta_d1(i)^2)*L;
    elseif Time(i)<t1+t2
        T(i) =m*g*cos(theta(i))+(m*theta_d1(i)^2)*L;
    elseif Time(i)< t1+t2+t3
        T(i) =m*g*cos(theta(i))-m*a*sin(theta(i))+(m*theta_d1(i)^2)*L;
    else
        T(i) =m*g*cos(theta(i))+(m*theta_d1(i)^2)*L;
    end
end

plot(Time,T)