function main()
clear;
clc;
%��Ⱥ��С
popsize=250;
%�����Ʊ��볤�� ���ռ��й�
daylen = 4;
chromlength=7.*100.*daylen; %7�������������Ա�ʾ��1-116�ֵ��и���Ŀ��100��ʾÿ���100������ô�и�ģ�10��ʾ10�죨��Ϊһ��������и���㹻��10������ɣ�
%�������
pc = 0.6;
%�������
pm = 0.2;
%��ʼ��Ⱥ
pop = initpop(popsize,chromlength);
d = binary2decimal(pop);
typen = 53;
% main��������Ҫά��һ������������ֵ
% ���ȶ�������
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
% ��Щ��Ҫ���޶���ʱ�����������
% ex 4��ʾ4��֮�ڣ� []�ڵ�����Ϊ��Ӧ��������Ҫ������ɵ����
ProducePlan = {4,  [5,7,9,12,15,18,20,25, 28,36,48]; 6,[4,11,24,29,32,38,40,46,50]};

load finalpattern.mat;

for i = 1:100000
    %������Ӧ��ֵ������ֵ��
    objvalue = cal_objvalue(pop,componentData, ProducePlan, finalpattern);
    fitvalue = objvalue;
    %ѡ�����
    newpop = selection(pop,fitvalue);
    %�������
    newpop = crossover(newpop,pc);
    %�������
    newpop = mutation(newpop,pm);
    %������Ⱥ
    
    pop = newpop;
    %Ѱ�����Ž�
    [bestindividual,bestfit] = best(pop,fitvalue);
    x2 = binary2decimal(bestindividual);
%     x1 = binary2decimal(newpop);
%     y1 = cal_objvalue(newpop,componentData, ProducePlan, finalpattern);
    if mod(i,50) == 0
        hold on;
        plot(i,bestfit,'*');
        title(['��������Ϊn=' num2str(i)]);
        %plot(x1,y1,'*');
        production_data = zeros(10,53);  % ���������࣬ÿһ�д���һ��
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