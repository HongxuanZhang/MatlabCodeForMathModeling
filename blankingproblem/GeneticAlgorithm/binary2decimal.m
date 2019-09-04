%二进制转化成十进制函数
%输入变量：
%二进制种群
%输出变量
%十进制数值
function popdec = binary2decimal(pop)
bin_num = 7; %该值由最大下料能力决定。
[px,py]=size(pop);

popdec = zeros(px,py/bin_num);  %这里一定可以整除7
for k = 1:px
    for j = 1:1000
        for i = 1:bin_num
            if pop(k,(j-1).*bin_num+i) == 1
                % 计算由二进制向十进制转换的值
                power = bin_num-i;
                popdec(k,j) = popdec(k,j)+2.^(power);
            end
        end
        popdec(k,j) = ceil(popdec(k,j).*(115/2.^(bin_num)))+1;
    end
end