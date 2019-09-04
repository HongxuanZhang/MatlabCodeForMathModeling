%% ��һ��
a = 0.5;
m = 6000;
praticalSolution = []; % t1~t4,һ������������5����ʾ���ڷ�����6����ʾ��ʱ��
for t1 = 0.01:0.05:sqrt((60./a)+1./(8.*a.^(2)))
    for t3 = 0.01:0.05:t1
        [theta,theta_d1,theta_d2,t2,t4,v_x,k] = GCsystemSolution(a,t1,t3,m,1/100,0);
        if t2<0 ||t4<0 || max(abs(theta)) >= 1 || t1+t2+t3+t4 >= 120 || abs(v_x)>0.5  % ��һ��Ҫ��2������
            continue;
        else
            praticalSolution = [praticalSolution;t1,t2,t3,t4,(max(theta(k:end))./180).*pi,t1+t2+t3+t4,v_x];
        end
    end
end
praticalSolution((praticalSolution(:,5))==min(praticalSolution(:,5)),:) % �����С�ڶ����ȵ�
%%
 [theta,theta_d1,theta_d2,t2,t4,v_x,k]=GCsystemSolution(0.5,5.0400 , 3.8400,6000,1/1000,1);
 (max(theta(k:end)).*180)./pi
%% �ڶ���
praticalSolution((praticalSolution(:,5).*(praticalSolution(:,6)))==min(praticalSolution(:,5).*praticalSolution(:,6)),:) 
praticalSolution((praticalSolution(:,5).*(praticalSolution(:,6).^2))==min(praticalSolution(:,5).*praticalSolution(:,6).^2),:) 
praticalSolution((praticalSolution(:,5).*(praticalSolution(:,6).^3))==min(praticalSolution(:,5).*praticalSolution(:,6).^3),:) 

praticalSolution((praticalSolution(:,5).*(praticalSolution(:,6)))==min(praticalSolution(:,5).*praticalSolution(:,6)),:) 
praticalSolution(((praticalSolution(:,5).^2).*(praticalSolution(:,6)))==min((praticalSolution(:,5).^2).*praticalSolution(:,6)),:) 
praticalSolution(((praticalSolution(:,5).^2).*(praticalSolution(:,6)))==min((praticalSolution(:,5).^2).*praticalSolution(:,6)),:) 

%% ������
praticalSolution_thrid = []; % t1~t4,һ������������5����ʾ���ڷ�����6����ʾ��ʱ��
for a = 0.1:0.05:1
    for t1 = 0:0.1:sqrt((60./a)+1./(8.*a.^(2)))
        for t3 = 0:0.1:t1
            mass = findMaxMass(a,t1,t3,1/100);
            [theta,theta_d1,theta_d2,t2,t4,v_x,k] = GCsystemSolution(a,t1,t3,mass,1/100,0);
            if t2<0 ||t4<0 || max(abs(theta)) >= 1 || t1+t2+t3+t4 >= 120 || abs(v_x)>0.5  % ��һ��Ҫ��2������
                continue;
            else
                praticalSolution_thrid = [praticalSolution_thrid;t1,t2,t3,t4,(max(theta(k:end))./180).*pi,t1+t2+t3+t4,v_x,m,a];
            end
        end
    end
end

