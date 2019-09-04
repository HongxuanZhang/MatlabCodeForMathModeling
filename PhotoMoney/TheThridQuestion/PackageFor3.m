X = CompletedTaskData;
[m,~] = size(X);
y_best = 1000000;
n_best = 0;
Success_best = 0;
Price_best = 0;
Success_now = 0;
Price_now = 0;
for n_means = 834:835
    [Idx,Ctrs,SumD,D] = kmeans(X(:,1:2),n_means,'Replicates',3);
    K_Means_Data = [];
    Sig =[];
    for i = 1:n_means
        dist =justShortestDistance(Ctrs(i,1),Ctrs(i,2));
        dist = (dist-0.005408576)./(0.9075939-0.005408576);
        [member_density,Credit] = findTopHundredClosestMember(MemberData,Ctrs(i,1),Ctrs(i,2));
        member_density = (member_density-0.0291)./(57.6110 - 0.0291);
        Credit = (Credit+19.4326)./(119.9267 + 19.4326);
        Assign_density = findTopHundredClosestPoint(CompletedTaskData,Ctrs(i,1),Ctrs(i,2));
        Assign_density = (Assign_density -0.0351)./(101.1338 - 0.0351);
        %[m_num,~] = size(X(Idx == i,1:2));
        % 衡量离散程度
%         dist_inside = zeros(1,m_num)
%         for j = 1:m_num
%             dist_inside(j) = distance(Ctrs(i,1),Ctrs(i,2),)
%         end
        %
        dist_inside = distance(Ctrs(i,1),Ctrs(i,2),X(Idx == i,1),X(Idx == i,2));
        dist_in = mean(dist_inside);
        % 打包信息
        % 打包的任务的中心，价格之和，个数，单价，任务密度，距离，信誉，人员密度（后面四个已经归一）
        K_Means_Data = [K_Means_Data;Ctrs(i,1:2),sum(PriceOfSecond(Idx==i,1)).*(1+0.03).^(sum(Idx==i)-1),sum(Idx==i),sum(PriceOfSecond(Idx==i,1)).*(1+0.03).^(sum(Idx==i)-1)./sum(Idx==i),Assign_density,dist,Credit,member_density,dist_in];
        
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
    N_max = max(K_Means_Data(:,4));
    
    H_max = max(K_Means_Data(:,10));
    
    % 人员密度最大值 57.6110
    % 任务密度最大值 101.1338
    % 信誉值最大值   119.9267
    % 距离           [1] 0.9075939  0.005408576
    
    ti = - 5.97108 + 0.09115.*K_Means_Data(:,5) - 2.29772.*K_Means_Data(:,6)+2.02514.*K_Means_Data(:,7)+0.22267.*K_Means_Data(:,8)-3.27788.*K_Means_Data(:,9);
    SuccessRate = 1./(1+exp(-ti)).*(1-((K_Means_Data(:,4)-1)./(2.*N_max)).^(2.5)).*(1-(K_Means_Data(:,10)./(2.*H_max)).^(2));
    Success = mean(SuccessRate);
    Prices = K_Means_Data(:,3);
    Price_now = sum(Prices);
    Success_now = Success;
    y = 1200./Success + 0.6.*sum(Prices)./(8.*40);
    if y<y_best
        y_best = y;
        n_best = n_means;
        Success_best = Success_now;
        Price_best = Price_now;
    end
end





