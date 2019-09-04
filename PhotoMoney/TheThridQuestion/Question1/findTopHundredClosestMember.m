function [member_density,Credit] = findTopHundredClosestMember(MemberData,Lat,Lon)
% 该函数用于寻找任意一点在附件一中任务周围最近的100任务的密度值
% 返回的是任意一点周围100人的值
dis = distance(MemberData(:,1),MemberData(:,2),Lat,Lon);
ClosePoint = [dis,MemberData(:,1:2),MemberData(:,3),MemberData(:,4)];
ClosePoint = sortrows(ClosePoint,1);
ClosePoint(:,1) = ClosePoint(:,1).*100;
Weight = (0.5).^(1:100);
Weight = Weight';
member_density = (1./ClosePoint(1:100,1)')*Weight;
Credit = (log(ClosePoint(1:100,4)).*(1./ClosePoint(1:100,1)))'*Weight;
%Quota =  ClosePoint(1:100,5)'*Weight;