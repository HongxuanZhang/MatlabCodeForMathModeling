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
b2