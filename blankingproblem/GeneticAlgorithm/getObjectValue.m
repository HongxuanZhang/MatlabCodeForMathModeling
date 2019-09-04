function [objvalue] = getObjectValue(componentData, ProducePlan,ways,waste,production_data)
% componentData �����������Ϣ����Ҫʹ����Ҫ��������Ŀ
% ProductionPlan �洢ĳ��֮ǰ�Ƿ�������
% ways ��ʹ�õ���������ʽ����Ŀ
% waste �������
% production_data ���������������ݣ�����i������j���k��
parts_num = 53;
fourDay = cell2mat(ProducePlan(1,2));
fourDay_imbalance = componentData(3,:)-sum(production_data(1:4,:));        % ����δ��ɵ�����Ĳ�ֵ
% ȡ������Ҫ��ɵ����
suppose_fourday_imbalance = fourDay_imbalance(1,fourDay);
suppose_fourday_imbalance(suppose_fourday_imbalance<0) = 0.1;

% SixDay = cell2mat(ProducePlan(2,2));
% SixDay_imbalance = componentData(3,:)-sum(production_data(1:6,:));        % ����δ��ɵ�����Ĳ�ֵ
% % ȡ������Ҫ��ɵ����
% suppose_sixday_imbalance = SixDay_imbalance(1,SixDay);
% suppose_sixday_imbalance(suppose_sixday_imbalance<0) = 0.1;

% �����10��֮�ڵ���ɶ�
production_num = sum(production_data(1:4,:));
score = zeros(1,parts_num);  % ����ÿ���������ɶȸ���
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
