function main()
clear;
clc;
%种群大小
popsize=250;
%二进制编码长度 与解空间有关
daylen = 4;
chromlength=7.*100.*daylen; %7个二进制数可以表示从1-116种的切割数目，100表示每天第100块是怎么切割的，10表示10天（认为一个优秀的切割方案足够在10天内完成）
%交叉概率
pc = 0.6;
%变异概率
pm = 0.2;
%初始种群
pop = initpop(popsize,chromlength);
d = binary2decimal(pop);
typen = 53;
% main函数中需要维持一个生产数量的值
% 首先读入数据
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

load finalpattern.mat;

for i = 1:100000
    %计算适应度值（函数值）
    objvalue = cal_objvalue(pop,componentData, ProducePlan, finalpattern);
    fitvalue = objvalue;
    %选择操作
    newpop = selection(pop,fitvalue);
    %交叉操作
    newpop = crossover(newpop,pc);
    %变异操作
    newpop = mutation(newpop,pm);
    %更新种群
    
    pop = newpop;
    %寻找最优解
    [bestindividual,bestfit] = best(pop,fitvalue);
    x2 = binary2decimal(bestindividual);
%     x1 = binary2decimal(newpop);
%     y1 = cal_objvalue(newpop,componentData, ProducePlan, finalpattern);
    if mod(i,50) == 0
        hold on;
        plot(i,bestfit,'*');
        title(['迭代次数为n=' num2str(i)]);
        %plot(x1,y1,'*');
        production_data = zeros(10,53);  % 横着是种类，每一行代表一天
        for j = 1:10 %
            production_data(j,:) = sum(finalpattern(x2(1,(j-1).*100+1:j.*100),1:53));
        end
        x2
        production_num = sum(production_data);
        componentData(3,:) - production_num(1,:)
        save('popopop','pop');
    end
end
% fprintf('The best X is --->>%5.2f\n',x2);
% fprintf('The best Y is --->>%5.2f\n',bestfit);