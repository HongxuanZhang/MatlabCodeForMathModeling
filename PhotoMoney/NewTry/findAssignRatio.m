function [Assign_CompleteRatio] = findAssignRatio(CompletedTaskData,Lat,Lon)
% 该函数用于寻找任意一点在附件一中任务周围最近的100任务的密度值
justArc = 20./pi.*180./6377;   % 对应20公里
S = pi.*(20).^2;
dis = distance(CompletedTaskData(:,1),CompletedTaskData(:,2),Lat,Lon);
[m,~]=size(dis(dis<=justArc));
n = 0;
Assign_CompleteRatio = n./m;