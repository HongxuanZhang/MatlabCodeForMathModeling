%������ת����ʮ���ƺ���
%���������
%��������Ⱥ
%�������
%ʮ������ֵ
function popdec = binary2decimal(pop)
bin_num = 7; %��ֵ�������������������
[px,py]=size(pop);

popdec = zeros(px,py/bin_num);  %����һ����������7
for k = 1:px
    for j = 1:1000
        for i = 1:bin_num
            if pop(k,(j-1).*bin_num+i) == 1
                % �����ɶ�������ʮ����ת����ֵ
                power = bin_num-i;
                popdec(k,j) = popdec(k,j)+2.^(power);
            end
        end
        popdec(k,j) = ceil(popdec(k,j).*(115/2.^(bin_num)))+1;
    end
end