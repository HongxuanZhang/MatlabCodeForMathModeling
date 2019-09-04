function [objvalue] = getObjectValue(componentData, ProducePlan,ways,waste,production_data)
% componentData 零件的生产信息，主要使用其要生产的数目
% ProductionPlan 存储某天之前是否必须完成
% ways 共使用到的生产方式的数目
% waste 生产损耗
% production_data 生产零件的相关数据，包括i天生产j零件k个
parts_num = 53;
fourDay = cell2mat(ProducePlan(1,2));
fourDay_imbalance = componentData(3,:)-sum(production_data(1:4,:));        % 四天未完成的零件的差值
% 取出四天要完成的零件
suppose_fourday_imbalance = fourDay_imbalance(1,fourDay);
suppose_fourday_imbalance(suppose_fourday_imbalance<0) = 0.1;

% SixDay = cell2mat(ProducePlan(2,2));
% SixDay_imbalance = componentData(3,:)-sum(production_data(1:6,:));        % 六天未完成的零件的差值
% % 取出六天要完成的零件
% suppose_sixday_imbalance = SixDay_imbalance(1,SixDay);
% suppose_sixday_imbalance(suppose_sixday_imbalance<0) = 0.1;

% 求解在10天之内的完成度
production_num = sum(production_data(1:4,:));
score = zeros(1,parts_num);  % 依照每种零件的完成度给分
for i = 1:parts_num
    if componentData(3,i) > production_num(1,i)
        score(i) =  1./(componentData(3,i) - production_num(1,i)).^5;
    elseif componentData(3,i) < production_num(1,i)
        score(i) = 1200 ./( production_num(1,i) - componentData(3,i));
    else 
        score(i) = 1000;
    end
end
objvalue = mean(score) + 1./ways + 1./( 0.5.*sum(waste)) + 1./(sum(suppose_fourday_imbalance)).^2 ...
           ; % + 1./(sum(suppose_sixday_imbalance)).^2 ;
