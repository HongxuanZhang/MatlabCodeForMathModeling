typen =53;
a = xlsread('D:\coding!!\Matlab\blankingproblem\Question1.xlsx');
componentData = zeros(3,typen);
for i = 1:typen
    row_num = ( i - mod(i,10))./10;
    if mod(i,10) == 0
        row_num = row_num - 1;
    end
    componentData(1,i) = a(1 + row_num.*3,i - row_num.*10);
    componentData(2,i) = a(2 + row_num.*3,i - row_num.*10);
    componentData(3,i) = a(3 + row_num.*3,i - row_num.*10);
end
% 有些需要在限定的时间内生产完毕
% ex 4表示4天之内， []内的内容为对应天数内需要生产完成的零件
ProducePlan = {4,  [5,7,9,12,15,18,20,25, 28,36,48]; 6,[4,11,24,29,32,38,40,46,50]};
priority = ones(1,typen);
priority(1,[5,7,9,12,15,18,20,25, 28,36,48]) = 10;
priority(1,[4,11,24,29,32,38,40,46,50]) = 5;
componentData = [componentData;priority];
prior_val = calculatePriority(componentData);
componentData = [componentData;prior_val];
temp = sortrows(componentData',5,'descend');
componentData = temp';
Material = zeros(10*100,55);
for i = 1:10
    prior_val = calculatePriority(componentData);
    componentData(5,:) = prior_val;
    temp = sortrows(componentData',5,'descend');
    componentData = temp';
    [Material((i-1).*100+1:i*100,:),componentData] = newDay(componentData);
end