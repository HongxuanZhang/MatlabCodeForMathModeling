clear  
clc  
  
E_new = inf;
E_current = inf;
E_best = inf;

E_best_plot = [];

%生成初始解  
design_type = 5;
design_length = 25;
design_mass = 5000;

current_type = design_type;
current_length = design_length;
current_mass = design_mass;

best_type = design_type;
best_length = design_length;
best_mass = design_mass;


rand('state',sum(clock)); %初始化随机数发生器  
t=120; %初始温度  
tf=1; %结束温度  
a = 0.99; %温度下降比例  
  
while t>=tf%（7）结束条件  
    for r=1:1000 %退火次数 
        E_best_plot = [ ];
        if rand < 0.6
            if (rand>0.5&&design_type~=5) || design_type == 1
                new_designtype =  design_type+1;
                if new_designtype == 6
                    new_designtype = 1;
                end
            else
                new_designtype =  design_type-1;
                if new_designtype == 0
                    new_designtype = 1;
                end
            end
        elseif rand<0.85
            if rand<0.5
                new_designtype = 1;
            else
                new_designtype = 5;
            end
        else
            new_designtype = design_type;
        end
        new_designlength = design_length+(design_length./100).*(rand>0.5)-(design_length./100).*(rand<0.5);
        new_designmass = design_mass+(design_mass./100).*(rand>0.5)-(design_mass./100).*(rand<0.5);
        
                %检查是否满足约束  
        if new_designtype<=0||new_designtype>5
            new_designtype = 5;
        end
        if new_designlength<= 15||new_designlength>= 50
            new_designlength = 25.0;
        end
        if new_designmass <= 2000 || new_designmass >=8000
            new_designmass = 5800;
        end
        % 退火过程  
        % E_new=sol_new1^2+sol_new2^2+8;%（2）目标函数  
        E_new = calculateObjectValueByNormalize(new_designtype,new_designlength,new_designmass);
        if E_new<E_current%（5）接受准则  
                E_current=E_new;  
%                 sol_current1=sol_new1;  
%                 sol_current2=sol_new2;  
%                 
                current_type = new_designtype;
                current_length = new_designlength;
                current_mass = new_designmass;
                if E_new<E_best  
                    %把冷却过程中最好的解保存下来  
                    E_best=E_new;  
                    best_type = new_designtype;
                    best_length = new_designlength;
                    best_mass = new_designmass;
                end  
        else  
                if rand<exp(-(E_new-E_current)/t)%（4）代价函数差  
                    E_current=E_new;
                    current_type = new_designtype;
                    current_length = new_designlength;
                    current_mass = new_designmass;
                else  
                    new_designtype = current_type ;
                    new_designlength = current_length;
                    new_designmass = current_mass;
                end  
        end  
        design_length = new_designlength;
        design_mass = new_designmass;
        design_type = new_designtype;
        E_best_plot = [E_best_plot E_best];
    end
    r = 1:1000;
    E_best_plot(E_best_plot>500) = 30;
    plot(r,E_best_plot,'.-');
    hold on;
    t=t*a;%（6）降温
end
  
disp('最优解为：')  
disp(best_length)  
disp(best_mass)
disp(best_type)
disp('目标表达式的最小值等于：')  
disp(E_best)  
