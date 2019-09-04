function [Member_density] = findMemberDensity(MemberData,Lat,Lon)
% �ú�������Ѱ������һ���ڸ���һ��������Χ�����100������ܶ�ֵ
justArc = 20./pi.*180./6377;   % ��Ӧ20����
S = pi.*(20).^2;
dis = distance(MemberData(:,1),MemberData(:,2),Lat,Lon);
[m,~]=size(dis(dis<=justArc));
Member_density = m./(S);