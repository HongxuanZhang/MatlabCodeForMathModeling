% 读入第一问数据
a = xlsread('D:\coding!!\Matlab\blankingproblem\Question1.xlsx');
b = zeros(3,53);
for i = 1:53
    row_num = ( i - mod(i,10))./10;
    if mod(i,10) == 0
        row_num = row_num - 1;
    end
    b(1,i) = a(1 + row_num.*3,i - row_num.*10);
    b(2,i) = a(2 + row_num.*3,i - row_num.*10);
    b(3,i) = a(3 + row_num.*3,i - row_num.*10);
end

% 读入第二问数据
a2 = xlsread('D:\coding!!\Matlab\blankingproblem\Question2.xlsx');
b2 = zeros(4,43);
for i = 1:43
    row_num = ( i - mod(i,10))./10;
    if mod(i,10) == 0
        row_num = row_num - 1;
    end
    b2(1,i) = a2(1 + row_num.*4,i - row_num.*10);
    b2(2,i) = a2(2 + row_num.*4,i - row_num.*10);
    b2(3,i) = a2(3 + row_num.*4,i - row_num.*10);
    b2(4,i) = a2(4 + row_num.*4,i - row_num.*10);
end
