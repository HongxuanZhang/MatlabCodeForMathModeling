%% 
% 该文件用于制作回归数据
RegressionData = [];
[m,n] = size(NewAssignment);
for i = 1:m
%     if CompletedTaskData(i,3)<=67.5
%         Pri = 1;
%     elseif CompletedTaskData(i,3)<=70
%         Pri = 2;
%     elseif CompletedTaskData(i,3)<=72.5
%         Pri = 3;
%     elseif CompletedTaskData(i,3)<=75
%         Pri = 4;
%     elseif CompletedTaskData(i,3)<=80
%         Pri = 5;
%     else
%         Pri = 6;
%     end
    if 1
        Pri = 0;
        CompleteDegree = findAssignRatio(NewAssignment,NewAssignment(i,1),NewAssignment(i,2));
        Credit = findMemberCredit(MemberData,NewAssignment(i,1),NewAssignment(i,2));
        RegressionData = [RegressionData;NewAssignment(i,1)./23,NewAssignment(i,2)./113,findMemberDensity(MemberData,NewAssignment(i,1),NewAssignment(i,2)),findAssignmentDensity(NewAssignment,NewAssignment(i,1),NewAssignment(i,2)),Credit];
    end
end
RegressionData(:,6) = (RegressionData(:,6)-min(RegressionData(:,6)))./(max(RegressionData(:,6)-min(RegressionData(:,6))))