function [theta,theta_d1,theta_d2,t2,t4,v_x,t4begin_pot] = GCsystemSolution(a,t1,t3,m,delta_t,IfPlot)
% a 加速度，单位 m/s^2
% t_1 t1时间长度
% t_3 t3时间长度
% m   负载重物的质量
% delta_t 微分的时间长度
 
% 定义各类常数
g = 9.8;
T_max = 20000;
a_max = 1;
V_x_max = 0.5;
D_1 = 60;
D_2 = 15;
L = 15;

t2 = 1/(a.*t1)*(D_1+(0.5.*a.*t3.^2)-(0.5.*a.*t1.^2)-(a.*t1.*t3));
t4 = D_2/(a.*(t1-t3));


t_uplimit = 2000;
t4begin_pot = -1000;
if t1+t2+t3+t4 >= t_uplimit
    theta = [0];
    theta_d1 =[-100];
    theta_d2=[-100];
    t2 = -100;
    t4 = -100; 
    v_x = 100;
    t4begin_pot = -1000;
    return;
end
% 考虑在此时间之内能到达的
Time = 0:delta_t:t_uplimit;
len_time = length(Time);

% 定义角系统。统计在运动过程中角参量的变化
theta = zeros(1,len_time);                % 利用abs 以及max 可以求得摆幅
theta_d1 = zeros(1,len_time);
theta_d2 = zeros(1,len_time);
T = [t1,t2,t3,t4];
T_sum = cumsum(T);

flag = 0;
for i = 1:len_time
    if i == 1
        theta(i) = 0;
        theta_d1(i) = 0;
        theta_d2(i) = a./L;
    end
    if Time(i)<= T_sum(end)
        theta(i+1) = theta(i)+theta_d1(i).*delta_t;
        theta_d1(i+1) = theta_d1(i) + theta_d2(i).*delta_t;
        if Time(i)<= T_sum(1)
            theta_d2(i+1) = (a.*cos(theta(i))-g.*sin(theta(i)))./L;
        elseif Time(i)<=T_sum(2)
            theta_d2(i+1) = (-g.*sin(theta(i)))./L;
        elseif Time(i)<=T_sum(3)
            theta_d2(i+1) = (-a.*cos(theta(i))-g.*sin(theta(i)))./L;
        elseif Time(i)<=T_sum(4) 
            if flag == 0
                flag = 1;
                t4begin_pot = i;
            end
            theta_d2(i+1) = (-g.*sin(theta(i)))./L;
        else
            break;
        end
    else
        break;
    end
    if m.*g.*cos(theta(i))+m.*a.*sin(theta(i))+(m.*theta_d1(i).^2).*L - 20000.*g >= 0
        theta = [0];
        theta_d1 =[-100];
        theta_d2=[-100];
        t2 = -100;
        t4 = -100;
        v_x = 100;
        t4begin_pot = -1000;
        return;
    end
end
v_x = a.*(t1-t3)-theta_d1(i).*L.*cos(theta(i));
if IfPlot
    subplot(3,1,1);
    plot(Time(1:i),(theta(1:i)./pi).*180);
    subplot(3,1,2);
    plot(Time(1:i),theta_d1(1:i));
    subplot(3,1,3);
    plot(Time(1:i),theta_d2(1:i));
end