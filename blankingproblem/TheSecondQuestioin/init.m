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
            gb_mat((n_5/2-1)*5+2,5) = 20*100+fillin_num;
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
        if mod(n_6,2)==1
            gb_mat(((n_6-1)/2)*5+2,6) = 35*100+fillin_num;
            n_6 = n_6+1;
        else
            gb_mat(((n_6/2)-1)*5+3,6) = 35*100+fillin_num;
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
