function [Assign_CompleteRatio] = findAssignRatio(CompletedTaskData,Lat,Lon)
% �ú�������Ѱ������һ���ڸ���һ��������Χ�����100������ܶ�ֵ
justArc = 20./pi.*180./6377;   % ��Ӧ20����
S = pi.*(20).^2;
dis = distance(CompletedTaskData(:,1),CompletedTaskData(:,2),Lat,Lon);
[m,~]=size(dis(dis<=justArc));
n = 0;
Assign_CompleteRatio = n./m;