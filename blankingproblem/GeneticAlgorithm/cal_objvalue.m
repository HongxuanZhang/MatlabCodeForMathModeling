%���㺯��Ŀ��ֵ
%�����������������ֵ
%���������Ŀ�꺯��ֵ
function [objvalue] = cal_objvalue(pop,componentData, ProducePlan, finalpattern)
x = binary2decimal(pop);
[pattern_num, parts_num] = size(finalpattern); % ע��parts_num�������������Ŀ��һ�����һ��Ϊԭ����ʧ�� 
%ת����������Ϊx�����ı仯��Χ����ֵ
[nx,ny] = size(x);
day = 10; % �ٶ���ʮ��
objvalue = zeros(nx,1);
for i = 1:nx
    production_data = zeros(day,parts_num-1);  % ���������࣬ÿһ�д���һ��
    waste = zeros(10,1);
    for j = 1:day %
        %production_data(j,:) = sum(x(i,(j-1).*pattern_num+1:j.*pattern_num)'.*finalpattern(:,1:53));     % ע��ת�ã� ,����10���ڵ���������ľ������
        production_data(j,:) = sum(finalpattern(x(i,(j-1).*100+1:j.*100),1:53));
        %waste(j) = sum(x(i,(j-1).*pattern_num+1:j.*pattern_num)'.*finalpattern(:,54));
        waste(j) = sum(finalpattern(x(i,(j-1).*100+1:j.*100),54));
    end
    % ����һ��ʹ�õ���������ʽ
    %ways = sum(sum(reshape(x(i,:),[pattern_num,day])')~=0);
    way = zeros(116,1);
    way(x(i,:),1) = 1;
    ways = sum(way);
    objvalue(i) = getObjectValue(componentData, ProducePlan,ways,waste,production_data);
end