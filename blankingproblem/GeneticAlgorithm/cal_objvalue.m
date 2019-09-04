%计算函数目标值
%输入变量：二进制数值
%输出变量：目标函数值
function [objvalue] = cal_objvalue(pop,componentData, ProducePlan, finalpattern)
x = binary2decimal(pop);
[pattern_num, parts_num] = size(finalpattern); % 注意parts_num比真正的零件数目多一，最后一个为原料损失量 
%转化二进制数为x变量的变化域范围的数值
[nx,ny] = size(x);
day = 10; % 假定是十天
objvalue = zeros(nx,1);
for i = 1:nx
    production_data = zeros(day,parts_num-1);  % 横着是种类，每一行代表一天
    waste = zeros(10,1);
    for j = 1:day %
        %production_data(j,:) = sum(x(i,(j-1).*pattern_num+1:j.*pattern_num)'.*finalpattern(:,1:53));     % 注意转置！ ,产生10天内的生产零件的具体情况
        production_data(j,:) = sum(finalpattern(x(i,(j-1).*100+1:j.*100),1:53));
        %waste(j) = sum(x(i,(j-1).*pattern_num+1:j.*pattern_num)'.*finalpattern(:,54));
        waste(j) = sum(finalpattern(x(i,(j-1).*100+1:j.*100),54));
    end
    % 计算一共使用到的生产方式
    %ways = sum(sum(reshape(x(i,:),[pattern_num,day])')~=0);
    way = zeros(116,1);
    way(x(i,:),1) = 1;
    ways = sum(way);
    objvalue(i) = getObjectValue(componentData, ProducePlan,ways,waste,production_data);
end