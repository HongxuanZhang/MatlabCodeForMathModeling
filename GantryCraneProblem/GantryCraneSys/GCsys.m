%% 第一问
a = 0.5;
m = 6000;
praticalSolution = []; % t1~t4,一行有六个，第5个表示最大摆幅，第6个表示总时间
for t1 = 5.0:0.001:5.2
    for t3 = 0.01:0.001:t1
        [theta,theta_d1,theta_d2,t2,t4,v_x,k] = GCsystemSolution(a,t1,t3,m,1/1000,0);
        if t2<0 ||t4<0 || max(abs(theta)) >= 1 || t1+t2+t3+t4 >= 120 || abs(v_x)>0.5  % 第一问要求2分钟内
            continue;
        else
            praticalSolution = [praticalSolution;t1,t2,t3,t4,(max(theta(k:end))./pi).*180,(min(theta(k:end))./pi).*180,t1+t2+t3+t4,v_x];
        end
    end
end
praticalSolution((praticalSolution(:,5)-praticalSolution(:,6))==min(praticalSolution(:,5)-praticalSolution(:,6)),:) % 输出最小摆动幅度的
%%
a = 1;
t1 = 6.9855;
t3 = 5.2557;
m = 19600;
 [theta,theta_d1,theta_d2,t2,t4,v_x,k]=GCsystemSolution(a,t1,t3,m,1/1000,1);
 t1+t2+t3+t4
 (max(theta(k:end)).*180)./pi
 (min(theta(k:end)).*180)./pi
%% 第二问
praticalSolution((praticalSolution(:,5).*(praticalSolution(:,6)))==min(praticalSolution(:,5).*praticalSolution(:,6)),:) 
praticalSolution((praticalSolution(:,5).*(praticalSolution(:,6).^2))==min(praticalSolution(:,5).*praticalSolution(:,6).^2),:) 
praticalSolution((praticalSolution(:,5).*(praticalSolution(:,6).^3))==min(praticalSolution(:,5).*praticalSolution(:,6).^3),:) 

praticalSolution((praticalSolution(:,5).*(praticalSolution(:,6)))==min(praticalSolution(:,5).*praticalSolution(:,6)),:) 
praticalSolution(((praticalSolution(:,5).^2).*(praticalSolution(:,6)))==min((praticalSolution(:,5).^2).*praticalSolution(:,6)),:) 
praticalSolution(((praticalSolution(:,5).^2).*(praticalSolution(:,6)))==min((praticalSolution(:,5).^2).*praticalSolution(:,6)),:) 

%% 第三问
praticalSolution_thrid = []; % t1~t4,一行有六个，第5个表示最大摆幅，第6个表示总时间
for a = 0.1:0.05:1
    for t1 = 0:0.1:sqrt((60./a)+1./(8.*a.^(2)))
        for t3 = 0:0.1:t1
            mass = findMaxMass(a,t1,t3,1/100);
            [theta,theta_d1,theta_d2,t2,t4,v_x,k] = GCsystemSolution(a,t1,t3,mass,1/100,0);
            if t2<0 ||t4<0 || max(abs(theta)) >= 1 || t1+t2+t3+t4 >= 120 || abs(v_x)>0.5  % 第一问要求2分钟内
                continue;
            else
                praticalSolution_thrid = [praticalSolution_thrid;t1,t2,t3,t4,(max(theta(k:end))./180).*pi,t1+t2+t3+t4,v_x,m,a];
            end
        end
    end
end

