function [member_density,Credit] = findTopHundredClosestMember(MemberData,Lat,Lon)
% �ú�������Ѱ������һ���ڸ���һ��������Χ�����100������ܶ�ֵ
% ���ص�������һ����Χ100�˵�ֵ
dis = distance(MemberData(:,1),MemberData(:,2),Lat,Lon);
ClosePoint = [dis,MemberData(:,1:2),MemberData(:,3),MemberData(:,4)];
ClosePoint = sortrows(ClosePoint,1);
ClosePoint(:,1) = ClosePoint(:,1).*100;
Weight = (0.5).^(1:100);
Weight = Weight';
member_density = (1./ClosePoint(1:100,1)')*Weight;
Credit = (log(ClosePoint(1:100,4)).*(1./ClosePoint(1:100,1)))'*Weight;
%Quota =  ClosePoint(1:100,5)'*Weight;