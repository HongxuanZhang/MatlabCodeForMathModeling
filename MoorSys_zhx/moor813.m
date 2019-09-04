%% ��һ��
moorsys(2,22.05,1200,18,12,0,1);
moorsys(2,22.05,1200,18,24,0,1);
%% �ڶ���
moorsys(2,22.05,1200,18,36,0,1)
%%
% ������������ ��ýǶ���������֮��Ĺ�ϵ
phi_t = [];
phi_j = [];
m = 1000:3000;
for mz=1000:3000
   [phi,f,h] = moorsys(2,22.05,mz,18,36,0,0);
   phi_t = [phi_t,phi(6)];
   phi_j = [phi_j,90-phi(216)];
end
plot(m,phi_t);
hold on
plot(m,phi_j);
h1 = refline(0,5);
h2 = refline(0,16);
set(h1,'color','black');
set(h2,'color','black');
legend('��Ͱ��б��','ê���뺣���н�');

% �۲�ͼ�����Եõ�һ�����µ�ֵ��2233����

%%
% ������������ ��ó�ˮ�����������֮��Ĺ�ϵ

h_s = [];
m = 6100:0.05:6150;
for mz=6100:0.05:6150
   [phi,f,h] = moorsys(2,22.05,mz,18,36,0,0);
   h_s = [h_s,h];
end
plot(m,h_s);

% �۲��ͼ����ˮ����������������������

%%
for m = 4000:1:5000
    [phi,f,h] = moorsys(2,22.05,m,18,36,0,0);
    if h>2
        m
        break;
    end
end


%%
%����m�½��ֵ
for m = 2200:0.05:2300
    [phi,f,h] = moorsys(2,22.05,m,18,36,0,0);
    if 90-phi(216)<16
        m
        break;
    end
end

%% ������
m = 2000:3000;
l = 20:30;
z_f =zeros(length(l),length(m))
z_h =zeros(length(l),length(m))
for m1 = 2000:3000
    for l1 = 20:30
        [~,f,h]=moorsys(2,l1,m1,18,36,1.5,0);
        z_f(l1,m1) = f;
        z_h(l1,m1) = h
    end
end 
%% ������
moorsys(5,21.40,4812,16,36,1.5,1);
moorsys(5,21.40,4812,18,36,1.5,1);
moorsys(5,21.40,4812,20,36,1.5,1);

��Ͱ����б����4.96322 ��,����ĳ�ˮ���Ϊ1.786369 m
�ĸ��ֹܵ���б�Ƿֱ���4.586576 ��,4.645660 ��,4.704930��,4.764385��
���׵�ê������Ϊ0.7200 m, �����ζ�����뾶18.901919 m
��Ͱ����б����4.85071 ��,����ĳ�ˮ���Ϊ1.807610 m
�ĸ��ֹܵ���б�Ƿֱ���4.480216 ��,4.538308 ��,4.596580��,4.655032��
���׵�ê������Ϊ0.0000 m, �����ζ�����뾶17.908866 m
��Ͱ����б����4.72101 ��,����ĳ�ˮ���Ϊ1.832863 m
�ĸ��ֹܵ���б�Ƿֱ���4.357586 ��,4.414540 ��,4.471667��,4.528968��
���׵�ê������Ϊ0.0000 m, �����ζ�����뾶16.638376 m