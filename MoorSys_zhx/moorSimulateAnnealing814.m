clear  
clc  
  
E_new = inf;
E_current = inf;
E_best = inf;

E_best_plot = [];

%���ɳ�ʼ��  
design_type = 5;
design_length = 25;
design_mass = 5000;

current_type = design_type;
current_length = design_length;
current_mass = design_mass;

best_type = design_type;
best_length = design_length;
best_mass = design_mass;


rand('state',sum(clock)); %��ʼ�������������  
t=120; %��ʼ�¶�  
tf=1; %�����¶�  
a = 0.99; %�¶��½�����  
  
while t>=tf%��7����������  
    for r=1:1000 %�˻���� 
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
        
                %����Ƿ�����Լ��  
        if new_designtype<=0||new_designtype>5
            new_designtype = 5;
        end
        if new_designlength<= 15||new_designlength>= 50
            new_designlength = 25.0;
        end
        if new_designmass <= 2000 || new_designmass >=8000
            new_designmass = 5800;
        end
        % �˻����  
        % E_new=sol_new1^2+sol_new2^2+8;%��2��Ŀ�꺯��  
        E_new = calculateObjectValueByNormalize(new_designtype,new_designlength,new_designmass);
        if E_new<E_current%��5������׼��  
                E_current=E_new;  
%                 sol_current1=sol_new1;  
%                 sol_current2=sol_new2;  
%                 
                current_type = new_designtype;
                current_length = new_designlength;
                current_mass = new_designmass;
                if E_new<E_best  
                    %����ȴ��������õĽⱣ������  
                    E_best=E_new;  
                    best_type = new_designtype;
                    best_length = new_designlength;
                    best_mass = new_designmass;
                end  
        else  
                if rand<exp(-(E_new-E_current)/t)%��4�����ۺ�����  
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
    t=t*a;%��6������
end
  
disp('���Ž�Ϊ��')  
disp(best_length)  
disp(best_mass)
disp(best_type)
disp('Ŀ����ʽ����Сֵ���ڣ�')  
disp(E_best)  
