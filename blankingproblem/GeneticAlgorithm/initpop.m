%初始化种群大小
%输入变量：
%popsize：种群大小
%chromlength：染色体长度-->>转化的二进制长度
%输出变量：
%pop：种群
function pop=initpop(popsize,chromlength)
%pop = round(rand(popsize,chromlength));
%所以返回的种群就是每行是一个个体，列数是染色体长度
% 在这里需要一个函数检测每天的生产量不能多余100
BinSq = dec2bin(0:127);
Decval = zeros(1,128);
bin_num =7;
for i = 1:128
    str = BinSq(i,:);
    for j = 1:length(str)
        num = str2num(str(j));
        if num == 1
            % 计算由二进制向十进制转换的值
            power = bin_num-j;
            Decval(1,i) = Decval(1,i)+ 2.^(power);
        end
    end
    Decval(1,i) = ceil(Decval(1,i).*(99/2.^(bin_num)))+1;
end

pop = zeros(popsize,chromlength);
for k = 1:popsize
    for day = 1:10
        oneday = zeros(1,100);
        for i = 1:100
            produceType = randi(116);
            oneday(1,i) = produceType;
        end
        for j = 1:100
            pop(k,(j-1).*7+(day-1).*100.*7+1:(j).*7+(day-1).*100.*7) = decimal2binary(oneday(1,j),BinSq,Decval) ;
        end
    end
end