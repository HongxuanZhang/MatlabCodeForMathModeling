praticalSolution_t = []; % t1~t4,һ������������5����ʾ���ڷ�����6����ʾ��ʱ��
for m = 5000:100:9000
    for a = 0.1:0.05:1
        for t1 = 0:0.1:sqrt((60./a)+1./(8.*a.^(2)))
            for t3 = 0:0.1:t1
                [theta,theta_d1,theta_d2,t2,t4,v_x] = GCsystemSolution(a,t1,t3,m,1/100,0);
                if t2<0 ||t4<0 || max(abs(theta)) >= 1 || t1+t2+t3+t4 >= 120 || abs(v_x)>0.5  % ��һ��Ҫ��2������
                    continue;
                else
                    praticalSolution_t = [praticalSolution_t;t1,t2,t3,t4,(max(theta)./180).*pi,t1+t2+t3+t4,v_x,m,a];
                end
            end
        end
    end
end