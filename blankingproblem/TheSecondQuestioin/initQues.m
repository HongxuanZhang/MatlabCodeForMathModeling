% 先执行Census.m文件导入plannum_50,plannum_35,plannum_30,plannum_20
% 此文件用于生成初始解（十进制位）
% 用已经有的规划方案
% 3 0 0 0 8 0 47
gb_mat = zeros(47*5,7)
% 前四天，
% 50，6个
% 35 0个
% 20 16个，最后一个可以任意选择
% 30 157个

% 产生6个50mm零件
for i = 1:3
    gb_mat((i-1)*5+1:(i-1)*5+2,1) = 5001;
end

% 产生16个20mm零件 

for i = 1:16
    if i<=13
        if mod(i,2) == 0
            gb_mat((i/2-1)*5+2,5) = 2001;
        else
            gb_mat((i-1)/2*5+1,5) = 2001;
        end
    elseif i == 14
        gb_mat(32,5) = 2002;
    elseif i == 15
        gb_mat(36,5) = 2003;
    elseif i == 16
        gb_mat(37,5) = 2004;
    end
end

% 生产20mm 1222个
len_20 = sum(plannum_20);
n_2 = 1;
n_3 = 1;
n_5 = 1;
n_7 = 1;

for i = 1:len
    fillin_num = 1;
    fillin_just = cumsum(plannum_30);
    for j = 1:length(plannum_30)
        if i <= fillin_just(j)
            fillin_num = j;
            break;
        end
    end
    if rand <0.5 && n_5~=17
        if mod(n_5,2) == 0
            gb_mat((n_5/2-1)*5+3,5) = 30*100+fillin_num;
        else
            gb_mat((n_5-1)/2*5+4,5) = 30*100+fillin_num;
        end
        n_5 = n_5+1;
    else
        if mod(n_7,3) == 0
            gb_mat((n_7/3-1)*5+3,7) = 30*100+fillin_num;
        else
            gb_mat((floor(n_7/3))*5+mod(n_7,3),7) = 30*100+fillin_num;
        end
        n_7 = n_7+1;
    end
end

%%
size(unique(okokoko','rows'))

%%
% 目前的规划方案
% 15 1 191 0 133 79 0
gb_mat = zeros(191*5,7);

% 分配20mm
len_20 = sum(plannum_20);
n_2 = 1;
n_3 = 1;
n_5 = 1;
for i = 1:len_20
    fillin_num = 1;
    fillin_just = cumsum(plannum_20);
    for j = 1:length(plannum_20)
        if i <= fillin_just(j)
            fillin_num = j;
            break;
        end
    end
    if rand <0.3 && n_2~=2
        gb_mat((floor(n_2/3))*5+mod(n_2,3),2) = 20*100+fillin_num;
        n_2 = n_2+1;
    elseif rand<0.7 && n_3~= 955
        gb_mat(n_3,3) = 20*100+fillin_num;
        n_3 = n_3+1;
    elseif n_5~= 267
        if mod(n_5,2) == 0
            gb_mat((n_5-1)/2*5+2,5) = 20*100+fillin_num;
            n_5 = n_5+1;
        else
            gb_mat((n_5-1)/2*5+1,5) = 20*100+fillin_num;
            n_5 = n_5+1;
        end
    else
        if n_2 ~= 2
            if mod(n_2,2)==0
                gb_mat((floor(n_2/3))*5+2,2) = 20*100+fillin_num;
                n_2 = n_2+1;
            else
                gb_mat((floor(n_2/3))*5+1,2) = 20*100+fillin_num;
                n_2 = n_2+1;
            end
        elseif n_3~= 955
            gb_mat(n_3,3) = 20*100+fillin_num;
            n_3 = n_3+1;
        end
    end
end

% 分配50mm
len_50 = sum(plannum_50);
n_1 = 1; % 30
n_2 = 1; % 1
for i = 1:len_50
    fillin_num = 1;
    fillin_just = cumsum(plannum_50);
    for j = 1:length(plannum_50)
        if i <= fillin_just(j)
            fillin_num = j;
            break;
        end
    end
    if rand <0.5 && n_1~= 31
        if mod(n_1,2) == 0
            gb_mat((floor((n_1-1)/2))*5+2,1) = 50*100+fillin_num;
            n_1 = n_1+1;
        else
            gb_mat((floor((n_1-1)/2))*5+1,1) = 50*100+fillin_num;
            n_1 = n_1+1;
        end
    elseif n_2~= 2
        gb_mat((floor(n_2/3))*5+3,2) = 50*100+fillin_num;
        n_2 = n_2+1;
    else
        if n_2 ~= 2
            gb_mat((n_2-1)*5+3,2) = 50*100+fillin_num;
            n_2 = n_2+1;
        elseif n_1 ~= 31
            if mod(n_1,2) == 0
                gb_mat((floor((n_1-1)/2))*5+2,1) = 50*100+fillin_num;
                n_1 = n_1+1;
            else
                gb_mat((floor((n_1-1)/2))*5+1,1) = 50*100+fillin_num;
                n_1 = n_1+1;
            end
        end
    end
end


% 分配35mm
len_35 = sum(plannum_35);
n_6 = 1; % 158
for i = 1:len_35
    fillin_num = 1;
    fillin_just = cumsum(plannum_35);
    for j = 1:length(plannum_35)
        if i <= fillin_just(j)
            fillin_num = j;
            break;
        end
    end
    if n_6~= 159
        if mod(n_6,1)==1
            gb_mat((floor(n_6/3))*5+2,6) = 35*100+fillin_num;
            n_6 = n_6+1;
        else
            gb_mat((floor(n_6/3))*5+3,6) = 35*100+fillin_num;
            n_6 = n_6+1;
        end
    else
        111111111111
    end
end

% 分配30mm
len_30 = sum(plannum_30);
n_2 = 1;  % 1
n_5 = 1;  % 266
n_6 = 1;  % 79
for i = 1:len_30
    fillin_num = 1;
    fillin_just = cumsum(plannum_30);
    for j = 1:length(plannum_30)
        if i <= fillin_just(j)
            fillin_num = j;
            break;
        end
    end
    if rand <0.3 && n_2~=2
        gb_mat((floor(n_2/3))*5+2,2) = 30*100+fillin_num;
        n_2 = n_2+1;
    elseif rand<0.7 && n_5~= 267
        if mod(n_5,2)==0
            gb_mat((floor(n_5/5))*5+4,5) = 30*100+fillin_num;
            n_5 = n_5+1;
        else
            gb_mat((floor(n_5/5))*5+3,5) = 30*100+fillin_num;
            n_5 = n_5+1;
        end
    elseif n_6~= 80
        gb_mat((floor(n_6/3))*5+1,6) = 30*100+fillin_num;
        n_6 = n_6+1;
    else
        if n_2 ~= 2
            gb_mat((floor(n_2/3))*5+2,2) = 30*100+fillin_num;
            n_2 = n_2+1;
        elseif  n_5~= 267
            if mod(n_5,2)==0
                gb_mat((floor(n_5/5))*5+4,5) = 30*100+fillin_num;
                n_5 = n_5+1;
            else
                gb_mat((floor(n_5/5))*5+3,5) = 30*100+fillin_num;
                n_5 = n_5+1;
            end
        end
    end
end
