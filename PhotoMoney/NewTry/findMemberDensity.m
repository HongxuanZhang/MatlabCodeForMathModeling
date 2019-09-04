function [Member_density] = findMemberDensity(MemberData,Lat,Lon)
% 该函数用于寻找任意一点在附件一中任务周围最近的100任务的密度值
justArc = 20./pi.*180./6377;   % 对应20公里
S = pi.*(20).^2;
dis = distance(MemberData(:,1),MemberData(:,2),Lat,Lon);
[m,~]=size(dis(dis<=justArc));
Member_density = m./(S);