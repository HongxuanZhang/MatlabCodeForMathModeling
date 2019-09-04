clear  
clc  

cutting_cost = 5;
typen = 53; % ��ʾ���������
controledCutting = 0; % �ܿص��и�


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
bignum = fix(sum(componentData(3,:))./53);


% ������Ϊ���Ƶ��и��
cutpattern = xlsread('D:\coding!!\Matlab\blankingproblem\SAtoSolveCuttingPlan\CutPattern.xlsx');
cutpattern(isnan(cutpattern)) = 0;
cutpattern = [cutpattern;cutpattern];
[controledCutting,~]=size(cutpattern);
cuttingpattern = zeros(controledCutting,typen);
for i = 1:controledCutting
    cuttingpattern(i,cutpattern(i,cutpattern(i,:)~=0)) = 1;
end

maxcut_num = fix(3000./componentData(2,:));
% adjustcut_num = componentData(3,:)>=100

allcut = typen.*2 + controledCutting;

E_new = 3000.*ones(1,allcut);
E_current = 3000.*ones(1,allcut);
E_best = 3000.*ones(1,allcut);

%���ɳ�ʼ��  
% d_type = 5;
% d_length = 25;
% d_mass = 5000;

CuttingPro = eye(typen);   % ��֤ĳ�����������һ���и�������и����
CuttingPattern = cuttingpattern;
CuttingPlan = [CuttingPro; CuttingPro;CuttingPattern];

% design_type = [5 5 5];
% design_length = [25 25 25];
% design_mass = [5000 5000 5000];

designCut = CuttingPlan;

% current_type = [design_type design_type design_type];                       
% current_length = [design_length design_length design_length];
% current_mass = [design_mass design_mass design_mass];
currentPro = CuttingPlan;

% best_type = [design_type design_type design_type];
% best_length = [design_length design_length design_length];
% best_mass = [design_mass design_mass design_mass];

bestPro = CuttingPlan; 

% new_designtype = [design_type design_type design_type];
% new_designlength = [design_length design_length design_length];
% new_designmass = [design_mass design_mass design_mass];

newPro = CuttingPlan;

rand('state',sum(clock)); %��ʼ�������������  
t=120; %��ʼ�¶�  
tf=1; %�����¶�  
a = 0.98; %�¶��½�����  
  
while t>=tf%��7����������  
    for r=1:1000 %�˻���� 
        newPro = designCut;
        for i = 1:allcut
            if i<=typen*2
                if rand < 0.6
                    if E_best(i) == 3000 && ~(t==120&&r==1)
                        alternativechange = newPro(i,newPro(i,:)~=0); % �Ӽ���ģʽ�ж���ɵ���������ֵ
                    else
                        alternativechange = 1:typen;
                    end
                    len = length(alternativechange);
                    for tempk = 1:5
                        change = alternativechange(randi(len));
                        if (rand<0.5 && newPro(i,change) ~= 0 )|| len~=typen
                            newPro(i,change) = newPro(i,change)-1;
                        elseif newPro(i,change) ~= maxcut_num(change)
                            newPro(i,change) = newPro(i,change)+1;
                        end
                    end
                elseif rand<0.98  % ��������ֵ
                    for tempk = 1:10
                        if tempk<=5
                            alternativechange = componentData(1,componentData(3,:)>=bignum); % �����޸������Ƚ϶��
                        else
                            alternativechange = 1:typen;
                        end
                        len = length(alternativechange);  
                        change = alternativechange(randi(len));
                        if rand<0.5 && newPro(i,change) ~= 0
                            newPro(i,change) = newPro(i,change)-1;
                        elseif newPro(i,change) ~= maxcut_num(change)
                            newPro(i,change) = newPro(i,change)+1;
                        end
                    end
                else
                    newPro(i,:) = newPro(i,:);
                end
            else
                if i<= controledCutting + 2*typen
                    alternativechange = cutpattern(i - 2*typen,cutpattern(i-2*typen,:)~=0); % �Ӽ���ģʽ�ж���ɵ���������ֵ
                elseif i <= 2*controledCutting + 2*typen
                    alternativechange = cutpattern(i - 2*typen - controledCutting,cutpattern(i-2*typen - controledCutting,:)~=0); 
                end
                len = length(alternativechange);
                for tempk = 1:len
                    change = alternativechange(randi(len));
                    if rand<0.5 && newPro(i,change) ~= 1
                        newPro(i,change) = newPro(i,change)-1;
                    elseif newPro(i,change) ~= maxcut_num(change)
                        newPro(i,change) = newPro(i,change)+1;
                    end
                end
            end
            
            %����Ƿ�����Լ��
            if any(newPro(i,:))<0
                newPro(i,newPro(i,:)<0) = 0;
            end
            if any(newPro(i,:))> maxcut_num
                newPro(i,newPro(i,:)> maxcut_num) = maxcut_num;
            end
            if i <= typen
                if newPro(i,i) == 0
                    newPro(i,i) = 1;  % ȷ�����ٵ�i�������Ϊ0��
                end
            elseif i>typen && i<=2*typen
                if newPro(i,i-typen) == 0
                    newPro(i,i-typen) = 1;  % ȷ�����ٵ�i�������Ϊ0��
                end
            end
        end
        % �˻����  
        % E_new=sol_new1^2+sol_new2^2+8;%��2��Ŀ�꺯��  
        for ktmp = 1:allcut
            E_new(ktmp) = ObjectValue(newPro(ktmp,:),componentData);
        end
        
        for j = 1:allcut
            if E_new(j)<E_current(j)%��5������׼��
                E_current(j)=E_new(j);
%                 current_type(i) = new_designtype(i);
%                 current_length(i) = new_designlength(i);
%                 current_mass(i) = new_designmass(i);
                currentPro(j,:) = newPro(j,:);
                if E_new(j)<E_best(j)
                    %����ȴ��������õĽⱣ������
                    E_best(j)=E_new(j);
%                     best_type(i) = new_designtype(i);
%                     best_length(i) = new_designlength(i);
%                     best_mass(i) = new_designmass(i);
                    bestPro(j,:) = newPro(j,:);
                end
            else
                if rand<exp(-(E_new(j)-E_current(j))/t)%��4�����ۺ�����
                    E_current(j)=E_new(j);
                    currentPro(j,:) = newPro(j,:);
                else
%                     new_designtype(i) = current_type(i) ;
%                     new_designlength(i) = current_length(i);
%                     new_designmass(i) = current_mass(i);
                    newPro(j,:) = currentPro(j,:);
                end
            end
%             design_length(i) = new_designlength(i);
%             design_mass(i) = new_designmass(i);
%             design_type(i) = new_designtype(i);
            designCut(j,:) = newPro(j,:);
        end
    end  
    t=t*a;%��6������
    E_bestp = mean(E_best);
    plot(t,E_bestp,'.')
    hold on;
end  
  
disp('���Ž�Ϊ��')  ;
disp(bestPro);  
% disp(best_mass)
% disp(best_type)
disp('Ŀ����ʽ����Сֵ���ڣ�')  ;
disp(E_best) ;