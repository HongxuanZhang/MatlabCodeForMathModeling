%��ʼ����Ⱥ��С
%���������
%popsize����Ⱥ��С
%chromlength��Ⱦɫ�峤��-->>ת���Ķ����Ƴ���
%���������
%pop����Ⱥ
function pop=initpop(popsize,chromlength)
%pop = round(rand(popsize,chromlength));
%���Է��ص���Ⱥ����ÿ����һ�����壬������Ⱦɫ�峤��
% ��������Ҫһ���������ÿ������������ܶ���100
BinSq = dec2bin(0:127);
Decval = zeros(1,128);
bin_num =7;
for i = 1:128
    str = BinSq(i,:);
    for j = 1:length(str)
        num = str2num(str(j));
        if num == 1
            % �����ɶ�������ʮ����ת����ֵ
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