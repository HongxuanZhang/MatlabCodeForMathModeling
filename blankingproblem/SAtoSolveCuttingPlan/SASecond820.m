E_new = inf ;
E_current = inf;
E_best = inf;

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


designCut = gb_mat;

% current_type = [design_type design_type design_type];                       
% current_length = [design_length design_length design_length];
% current_mass = [design_mass design_mass design_mass];
currentPro = gb_mat;

% best_type = [design_type design_type design_type];
% best_length = [design_length design_length design_length];
% best_mass = [design_mass design_mass design_mass];

bestPro = gb_mat; 

% new_designtype = [design_type design_type design_type];
% new_designlength = [design_length design_length design_length];
% new_designmass = [design_mass design_mass design_mass];

newPro = gb_mat;

rand('state',sum(clock)); %初始化随机数发生器  
t=240; %初始温度  
tf=1; %结束温度  
a = 0.99; %温度下降比例  
  
[mat_20,mat_30,mat_35,mat_50] = extractBySize(gb_mat);

while t>=tf%（7）结束条件
    for r=1:1000 %退火次数
        newPro = designCut;
        if rand < 0.6
            % 产生几个扰动后的解
            for kp = 1:10
                mat_change = [];
                while isempty(mat_change)
                    type = randi(4);
                    if type == 1
                        mat_change = mat_20;
                    elseif type == 2
                        mat_change = mat_30;
                    elseif type == 3
                        mat_change = mat_35;
                    elseif type == 4
                        mat_change = mat_50;
                    else
                        continue;
                    end
                end
                [num ,~] = size(mat_change);
                tempk=0;
                ty = 0;
                while tempk <= 5 && ty <= 100
                    c1 = randi(num);
                    c2 = randi(num);
                    while c1 == c2
                        c1 = randi(num);
                    end
                    if newPro(mat_change(c1,1),mat_change(c1,2)) ~= newPro(mat_change(c2,1),mat_change(c2,2))
                        temp_num = newPro(mat_change(c1,1),mat_change(c1,2));
                        newPro(mat_change(c1,1),mat_change(c1,2)) = newPro(mat_change(c2,1),mat_change(c2,2));
                        newPro(mat_change(c2,1),mat_change(c2,2)) = temp_num;
                        tempk =tempk+1;
                    else
                        ty = ty+1;
                        continue;
                    end
                end
            end
        elseif rand<0.98  % 调整三个值
            mat_change = [];
            while isempty(mat_change)
                type = randi(4);
                if type == 1
                    mat_change = mat_20;
                elseif type == 2
                    mat_change = mat_30;
                elseif type == 3
                    mat_change = mat_35;
                elseif type == 4
                    mat_change = mat_50;
                else
                    continue;
                end
            end
            [num ,~] = size(mat_change);
            tempk=0;
            ty = 0;
            while tempk <= 5 && ty <= 100
                c1 = randi(num);
                c2 = randi(num);
                while c1 == c2
                    c1 = randi(num);
                end
                if newPro(mat_change(c1,1),mat_change(c1,2)) ~= newPro(mat_change(c2,1),mat_change(c2,2))
                    temp_num = newPro(mat_change(c1,1),mat_change(c1,2));
                    newPro(mat_change(c1,1),mat_change(c1,2)) = newPro(mat_change(c2,1),mat_change(c2,2));
                    newPro(mat_change(c2,1),mat_change(c2,2)) = temp_num;
                    tempk =tempk+1;
                else
                    ty = ty+1;
                    continue;
                end
            end
        else
           newPro = newPro;
        end
        
        
        %检查是否满足约束
     
        % 退火过程
        % E_new=sol_new1^2+sol_new2^2+8;%（2）目标函数
        E_new = ObjectValueOfDifferentType(newPro);
        
        if E_new<E_current%（5）接受准则
            E_current=E_new;
            currentPro = newPro;
            if E_new<E_best
                %把冷却过程中最好的解保存下来
                E_best=E_new;
                bestPro = newPro;
            end
        else
            if rand<exp(-(E_new-E_current)/t)%（4）代价函数差
                E_current = E_new;
                currentPro = newPro;
            else
                newPro = currentPro;
            end
        end
        designCut = newPro;
    end
    t=t*a;%（6）降温
    plot(t,E_best,'.')
    hold on;
end

disp('最优解为：')  ;
disp(bestPro);
disp('目标表达式的最小值等于：')  ;
disp(E_best) ;