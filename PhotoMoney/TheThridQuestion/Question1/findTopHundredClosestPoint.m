function [Assign_density] = findTopHundredClosestPoint(CompletedTaskData,Lat,Lon)
% �ú�������Ѱ������һ���ڸ���һ��������Χ�����100������ܶ�ֵ

% justArc = 20./pi.*180./6377;   % ��Ӧ20����
% S = pi.*(20).^2;

dis = distance(CompletedTaskData(:,1),CompletedTaskData(:,2),Lat,Lon);
ClosePoint = [dis,CompletedTaskData(:,1:2)];
ClosePoint = sortrows(ClosePoint,1);
ClosePoint(:,1) = ClosePoint(:,1).*100;
ClosePoint(ClosePoint(:,1)==0,1) = 0.5;
% [m,~]=size(dis(dis<=justArc));
Weight = (0.5).^(1:100);
Weight = Weight';
% Assign_density = m./(S);
Assign_density = (1./ClosePoint(1:100,1)')*Weight;
