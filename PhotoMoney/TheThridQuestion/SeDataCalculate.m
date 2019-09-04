Ctrs = CompletedTaskData;
K_Means_Data = [];
for i = 1:835
    dist =justShortestDistance(Ctrs(i,1),Ctrs(i,2));
    dist = (dist-0.005408576)./(0.9075939-0.005408576);
    [member_density,Credit] = findTopHundredClosestMember(MemberData,Ctrs(i,1),Ctrs(i,2));
    member_density = (member_density-0.0291)./(57.6110 - 0.0291);
    Credit = (Credit+19.4326)./(119.9267 + 19.4326);
    Assign_density = findTopHundredClosestPoint(CompletedTaskData,Ctrs(i,1),Ctrs(i,2));
    Assign_density = (Assign_density -0.0351)./(101.1338 - 0.0351);
    % �����Ϣ
    % �������������ģ��۸�֮�ͣ����������ۣ������ܶȣ����룬��������Ա�ܶȣ������ĸ��Ѿ���һ��
    K_Means_Data = [K_Means_Data;Ctrs(i,1:2),sum(PriceOfSecond(i,1)),sum(Idx==i),sum(PriceOfSecond(i,1))./sum(Idx==i),Assign_density,dist,Credit,member_density];
    
    [op,~] = size(Idx);
    %
    %         for k = 1:op
    %             if Idx(k,1) == i
    %                 fprintf('A%04d ',k)
    %             end
    %             if k == op
    %                 fprintf('\n');
    %             end
    %         end
end


% ��Ա�ܶ����ֵ 57.6110
% �����ܶ����ֵ 101.1338
% ����ֵ���ֵ   119.9267
% ����           [1] 0.9075939  0.005408576

ti = - 5.97108 + 0.09115.*K_Means_Data(:,5) - 2.29772.*K_Means_Data(:,6)+2.02514.*K_Means_Data(:,7)+0.22267.*K_Means_Data(:,8)-3.27788.*K_Means_Data(:,9);
SuccessRate = 1./(1+exp(-ti));
Success = mean(SuccessRate);
Prices = K_Means_Data(:,3);
Price_now = sum(Prices);
Success_now = Success;
